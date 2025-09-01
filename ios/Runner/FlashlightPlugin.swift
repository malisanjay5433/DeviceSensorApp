import Flutter
import UIKit
import AVFoundation

public class FlashlightPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flashlight_channel", binaryMessenger: registrar.messenger())
        let instance = FlashlightPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getFlashlightState":
            getFlashlightState(result: result)
        case "toggleFlashlight":
            toggleFlashlight(result: result)
        case "enableFlashlight":
            enableFlashlight(result: result)
        case "disableFlashlight":
            disableFlashlight(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func getFlashlightState(result: @escaping FlutterResult) {
        guard let device = AVCaptureDevice.default(for: .video) else {
            result([
                "isAvailable": false,
                "isOn": false
            ])
            return
        }
        
        let isAvailable = device.hasTorch
        let isOn = device.torchMode == .on
        
        result([
            "isAvailable": isAvailable,
            "isOn": isOn
        ])
    }
    
    private func toggleFlashlight(result: @escaping FlutterResult) {
        guard let device = AVCaptureDevice.default(for: .video) else {
            result(FlutterError(code: "FLASHLIGHT_ERROR", message: "Flashlight not available", details: nil))
            return
        }
        
        do {
            try device.lockForConfiguration()
            if device.torchMode == .on {
                device.torchMode = .off
            } else {
                device.torchMode = .on
            }
            device.unlockForConfiguration()
            result(nil)
        } catch {
            result(FlutterError(code: "FLASHLIGHT_ERROR", message: "Failed to toggle flashlight", details: error.localizedDescription))
        }
    }
    
    private func enableFlashlight(result: @escaping FlutterResult) {
        guard let device = AVCaptureDevice.default(for: .video) else {
            result(FlutterError(code: "FLASHLIGHT_ERROR", message: "Flashlight not available", details: nil))
            return
        }
        
        do {
            try device.lockForConfiguration()
            device.torchMode = .on
            device.unlockForConfiguration()
            result(nil)
        } catch {
            result(FlutterError(code: "FLASHLIGHT_ERROR", message: "Failed to enable flashlight", details: error.localizedDescription))
        }
    }
    
    private func disableFlashlight(result: @escaping FlutterResult) {
        guard let device = AVCaptureDevice.default(for: .video) else {
            result(FlutterError(code: "FLASHLIGHT_ERROR", message: "Flashlight not available", details: nil))
            return
        }
        
        do {
            try device.lockForConfiguration()
            device.torchMode = .off
            device.unlockForConfiguration()
            result(nil)
        } catch {
            result(FlutterError(code: "FLASHLIGHT_ERROR", message: "Failed to disable flashlight", details: error.localizedDescription))
        }
    }
}
