#import "FlutterhellopluginPlugin.h"
#import <flutterhelloplugin/flutterhelloplugin-Swift.h>

@implementation FlutterhellopluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterhellopluginPlugin registerWithRegistrar:registrar];
}
@end
