import Flutter
import UIKit

public class RotationCheckPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "rotation_check", binaryMessenger: registrar.messenger())
    let instance = RotationCheckPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "isRotationLocked":
      UIDevice.current.beginGeneratingDeviceOrientationNotifications()

      if UIDevice.current.orientation.isValidInterfaceOrientation {
         result(false)
      } else {
         result(true)
      }

      UIDevice.current.endGeneratingDeviceOrientationNotifications()
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
