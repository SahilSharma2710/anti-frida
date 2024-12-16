#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "AntiFrida.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* fridaChannel = [FlutterMethodChannel methodChannelWithName:@"com.example.anti_frida"
                                                                    binaryMessenger:controller.binaryMessenger];
    
    [fridaChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        if ([@"detectFrida" isEqualToString:call.method]) {
            BOOL fridaDetected = isFridaRunning();
            result(@(fridaDetected));
        } else {
            result(FlutterMethodNotImplemented);
        }
    }];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
