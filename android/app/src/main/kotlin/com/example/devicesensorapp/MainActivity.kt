package com.example.devicesensorapp

import android.content.Context
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraManager
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "flashlight_channel"
    private var cameraManager: CameraManager? = null
    private var cameraId: String? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        cameraId = cameraManager?.cameraIdList?.get(0)
        
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getFlashlightState" -> {
                    try {
                        val isAvailable = cameraId != null
                        val isOn = if (isAvailable) {
                            cameraManager?.getCameraCharacteristics(cameraId!!)
                                ?.get(android.hardware.camera2.CameraCharacteristics.FLASH_INFO_AVAILABLE) == true
                        } else false
                        
                        result.success(mapOf(
                            "isAvailable" to isAvailable,
                            "isOn" to isOn
                        ))
                    } catch (e: Exception) {
                        result.error("FLASHLIGHT_ERROR", "Failed to get flashlight state", e.message)
                    }
                }
                "toggleFlashlight" -> {
                    try {
                        if (cameraId != null) {
                            val isOn = isFlashlightOn()
                            if (isOn) {
                                cameraManager?.setTorchMode(cameraId!!, false)
                            } else {
                                cameraManager?.setTorchMode(cameraId!!, true)
                            }
                            result.success(null)
                        } else {
                            result.error("FLASHLIGHT_ERROR", "Flashlight not available", null)
                        }
                    } catch (e: CameraAccessException) {
                        result.error("FLASHLIGHT_ERROR", "Camera access denied", e.message)
                    } catch (e: Exception) {
                        result.error("FLASHLIGHT_ERROR", "Failed to toggle flashlight", e.message)
                    }
                }
                "enableFlashlight" -> {
                    try {
                        if (cameraId != null) {
                            cameraManager?.setTorchMode(cameraId!!, true)
                            result.success(null)
                        } else {
                            result.error("FLASHLIGHT_ERROR", "Flashlight not available", null)
                        }
                    } catch (e: Exception) {
                        result.error("FLASHLIGHT_ERROR", "Failed to enable flashlight", e.message)
                    }
                }
                "disableFlashlight" -> {
                    try {
                        if (cameraId != null) {
                            cameraManager?.setTorchMode(cameraId!!, false)
                            result.success(null)
                        } else {
                            result.error("FLASHLIGHT_ERROR", "Flashlight not available", null)
                        }
                    } catch (e: Exception) {
                        result.error("FLASHLIGHT_ERROR", "Failed to disable flashlight", e.message)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun isFlashlightOn(): Boolean {
        return try {
            cameraManager?.getCameraCharacteristics(cameraId!!)
                ?.get(android.hardware.camera2.CameraCharacteristics.FLASH_INFO_AVAILABLE) == true
        } catch (e: Exception) {
            false
        }
    }
}