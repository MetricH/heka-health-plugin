import Flutter
import UIKit

public class SwiftHekaHealthPlugin: NSObject, FlutterPlugin {
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
    if call.method.elementsEqual("checkHealthKitPermissions") {
      checkHealthKitPermissions(call: call, result: result)
    }
    if call.method.elementsEqual("disconnect") {
      stopSyncing(call: call, result: result)
    }
  }

  func stopSyncing(call: FlutterMethodCall, result: @escaping FlutterResult) {
    let healthStore = HealthStore()
    healthStore.stopObserverQuery()
    result(true)
  }

  func requestAuthorization(call: FlutterMethodCall, result: @escaping FlutterResult) {
    let healthStore = HealthStore()
    healthStore.requestAuthorization {
      success in
      if success {
        result(true)
      } else {
        result(false)
      }
    }
  }

  func checkHealthKitPermissions(call: FlutterMethodCall, result: @escaping FlutterResult) {
    let healthStore = HealthStore()
    result(healthStore.checkHealthKitPermissions())
  }

  func syncIosHealthData(call: FlutterMethodCall, result: @escaping FlutterResult) {
    let healthStore = HealthStore()
    healthStore.requestAuthorization {
      success in
      if success {
        // Setup observer query
        guard let args = call.arguments as? [String: String] else { return }
        let apiKey = args["apiKey"]!
        let userUuid = args["userUuid"]!

        healthStore.setupStepsObserverQuery(apiKey: apiKey, userUuid: userUuid)

      }
      result(0)
    }
  }
}
