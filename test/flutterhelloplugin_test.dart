import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_hello_plugin/flutterhelloplugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutterhelloplugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Flutterhelloplugin.platformVersion, '42');
  });
}
