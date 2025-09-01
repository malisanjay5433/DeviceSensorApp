import UIKit
import Flutter
import AVFoundation

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let flashlightChannel = FlutterMethodChannel(name: "flashlight_channel",
                                                binaryMessenger: controller.binaryMessenger)
    flashlightChannel.setMethodCallHandler { (call, result) in
      switch call.method {
      case "getFlashlightState":
        self.getFlashlightState(result: result)
      case "toggleFlashlight":
        self.toggleFlashlight(result: result)
      case "enableFlashlight":
        self.enableFlashlight(result: result)
      case "disableFlashlight":
        self.disableFlashlight(result: result)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
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
