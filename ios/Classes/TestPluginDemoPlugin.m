#import "TestPluginDemoPlugin.h"
#import "TestPluginViewFactory.h"
@implementation TestPluginDemoPlugin

+(void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  
    TestPluginViewFactory *testViewFactory = [[TestPluginViewFactory alloc] initWithMessenger:registrar.messenger];
//这里填写的id 一定要和dart里面的viewType 这个参数传的id一致
    [registrar registerViewFactory:testViewFactory withId:@"testView"];
    
}

@end
