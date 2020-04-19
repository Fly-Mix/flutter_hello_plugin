#import "FlutterHelloPlugin.h"
#import <flutter_hello_plugin/flutter_hello_plugin-Swift.h>

@implementation FlutterHelloPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterHelloPlugin registerWithRegistrar:registrar];
}
@end
