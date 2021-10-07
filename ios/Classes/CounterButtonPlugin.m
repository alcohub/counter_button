#import "CounterButtonPlugin.h"
#if __has_include(<counter_button/counter_button-Swift.h>)
#import <counter_button/counter_button-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "counter_button-Swift.h"
#endif

@implementation CounterButtonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCounterButtonPlugin registerWithRegistrar:registrar];
}
@end
