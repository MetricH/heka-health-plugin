#import "HekaHealthPlugin.h"
#if __has_include(<heka_health/heka_health-Swift.h>)
#import <heka_health/heka_health-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "heka_health-Swift.h"
#endif

@implementation HekaHealthPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHekaHealthPlugin registerWithRegistrar:registrar];
}
@end
