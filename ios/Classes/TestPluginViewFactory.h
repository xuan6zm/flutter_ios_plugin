//
//  TestPluginViewFactory.h
//  Pods
//
//  Created by 小炫 on 2021/7/20.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface TestPluginViewFactory : NSObject<FlutterPlatformViewFactory>
/// 重写一个构造方法 来接收 Flutter 相关蚕食
/// @param messenger Flutter类 包含回调方法等信息
-(instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end

NS_ASSUME_NONNULL_END
