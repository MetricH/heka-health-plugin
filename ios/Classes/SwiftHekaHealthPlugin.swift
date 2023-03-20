import Flutter
import HekaCore
import UIKit

public class SwiftHekaHealthPlugin: NSObject, FlutterPlugin {

  let hekaManager = HekaManager()

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "heka_health", binaryMessenger: registrar.messenger())
    let instance = SwiftHekaHealthPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method.elementsEqual("syncIosHealthData") {
      syncIosHealthData(call: call, result: result)
    }
    if call.method.elementsEqual("requestAuthorization") {
      requestAuthorization(call: call, result: result)
    }
    if call.method.elementsEqual("disconnect") {
      stopSyncing(call: call, result: result)
    }
  }

  func stopSyncing(call: FlutterMethodCall, result: @escaping FlutterResult) {
    hekaManager.stopSyncing()
    result(true)
  }

  func requestAuthorization(call: FlutterMethodCall, result: @escaping FlutterResult) {
    hekaManager.requestAuthorization {
      sucess in
      if sucess {
        result(true)
      } else {
        result(false)
      }
    }
  }

  func syncIosHealthData(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any?] else { return }
    guard let apiKey = args["apiKey"]! as? String else { return }
    guard let userUuid = args["userUuid"]! as? String else { return }
    hekaManager.syncIosHealthData(apiKey: apiKey, userUuid: userUuid) {
      sucess in
      if sucess {
        result(true)
      } else {
        result(false)
      }
    }
  }
}
