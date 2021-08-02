//
//  TestPluginView.h
//  Pods
//
//  Created by 小炫 on 2021/7/20.
//

#import <Foundation/Foundation.h>
#include <Flutter/Flutter.h>


@interface TestPluginView : NSObject<FlutterPlatformView>
- (id)initWithFrame:(CGRect)frame
             viewId:(int64_t)viewId
               args:(id)args
           messager:(NSObject<FlutterBinaryMessenger>*)messenger;
@end
