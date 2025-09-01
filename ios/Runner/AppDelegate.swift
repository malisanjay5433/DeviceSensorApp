import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let flashlightChannel = FlutterMethodChannel(name: "flashlight_channel",
                                                binaryMessenger: controller.binaryMessenger)
    let flashlightPlugin = FlashlightPlugin()
    flashlightChannel.setMethodCallHandler(flashlightPlugin.handle(_:result:))
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
