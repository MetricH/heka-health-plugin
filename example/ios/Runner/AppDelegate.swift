import Flutter
import UIKit
import heka

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    HekaManager().installObservers()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
