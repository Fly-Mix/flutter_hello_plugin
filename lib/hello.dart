/// Copyright (C), 2018-2020, York
/// FileName: hello.dart.dart
/// Author: York
/// Date: 2020/4/19 12:42
/// Description:
import 'dart:async';
import 'package:flutter/services.dart';

class HelloPlugin {
  static const MethodChannel _channel = const MethodChannel('flutter_hello_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
