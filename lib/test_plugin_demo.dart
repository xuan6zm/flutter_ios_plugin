
import 'dart:async';

import 'package:flutter/services.dart';

/// NOTE:定义一个controller创建成功回调
typedef void TestViewCreatedCallback(TestPluginDemo controller);

/// NOTE:通过字符串test_plugin_demo约定MethodChannel
/// NOTE:这里主要负责和原生进行交互,调用原生的方法和监听原生方法,
class TestPluginDemo {
  MethodChannel _channel;
  TestPluginDemo.init(int id){
    _channel = new MethodChannel('test_plugin_demo');
    _channel.setMethodCallHandler(platformCallHandler);///设置原生参数监听
  }
  ///Flutter 调用原生
  ///这里我传了一个 字符串 当然也可以传Map
  Future<void> changeNativeTitle(String str) async{
    return _channel.invokeListMethod('changeNativeTitle',str);
  }

  ///实现监听原生方法回调
  Future<dynamic> platformCallHandler(MethodCall call) async {
    switch (call.method) {
      case "clickAciton":
        print('收到原生回调 ---- $call.arguments');
        return ;
        break;
    }
  }
}