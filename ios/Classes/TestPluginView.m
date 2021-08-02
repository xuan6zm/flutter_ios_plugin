//
//  TestPluginView.m
//  Pods
//
//  Created by 小炫 on 2021/7/20.
//

#import "TestPluginView.h"

@interface TestPluginView ()
/** channel*/
@property (nonatomic, strong) FlutterMethodChannel  *channel;
@property (nonatomic, strong) UIButton *button;
@end

@implementation TestPluginView
{
    CGRect _frame;
    int64_t _viewId;
    id _args;
   
}

- (id)initWithFrame:(CGRect)frame
  viewId:(int64_t)viewId
    args:(id)args
messager:(NSObject<FlutterBinaryMessenger>*)messenger
{
    if (self = [super init])
    {
        _frame = frame;
        _viewId = viewId;
        _args = args;
        
        ///建立通信通道 用来 监听Flutter 的调用和 调用Fluttter 方法 这里的名称要和Flutter 端保持一致
        _channel = [FlutterMethodChannel methodChannelWithName:@"test_plugin_demo" binaryMessenger:messenger];
        
        __weak __typeof__(self) weakSelf = self;

        [_channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            [weakSelf onMethodCall:call result:result];
        }];
       
    }
    return self;
}

- (UIView *)view{
    
    UIView *nativeView = [[UIView alloc] initWithFrame:_frame];
    nativeView.backgroundColor = [UIColor purpleColor];

    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button setTitle:@"我是按钮" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.button setBackgroundColor:[UIColor redColor]];
    self.button.frame = CGRectMake(100, 100, 200, 100);
    [nativeView addSubview:self.button];
     [self.button addTarget:self action:@selector(flutterMethod) forControlEvents:UIControlEventTouchUpInside];

    return nativeView;
     
}
#pragma mark -- Flutter 交互监听
-(void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result{
    //监听Fluter
    if ([[call method] isEqualToString:@"changeNativeTitle"]) {
        [self.button setTitle:call.arguments forState:UIControlStateNormal];
    }
    
}
//调用Flutter
- (void)flutterMethod{
    [self.channel invokeMethod:@"clickAciton" arguments:@"传递参数"];
}

@end
