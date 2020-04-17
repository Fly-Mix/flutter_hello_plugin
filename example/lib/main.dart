import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_hello_plugin/flutterhelloplugin.dart'
    show Flutterhelloplugin, R_Asset, R_Widget;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await Flutterhelloplugin.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    var imageWidget1 = Image(
      image: R_Asset.test_only_main_asset_1,
      width: 100,
      height: 100,
    );

    var imageWidget2 = Image(
      image: R_Asset.test_png_variant_1,
      width: 100,
      height: 100,
    );

    var imageWidget3 = Image(
      image: R_Asset.test_only_main_asset_2,
      width: 100,
      height: 100,
    );

    var imageWidget4 = Image(
      image: R_Asset.test_png_variant_2,
      width: 100,
      height: 100,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Hello Plugin Demo'),
        ),
        body: SingleChildScrollView(
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Running on: $_platformVersion\n'),
              imageWidget1,
              imageWidget2,
              imageWidget3,
              imageWidget4,
              R_Widget.test_only_main_asset_1(),
              R_Widget.test_png_variant_1(),
              R_Widget.test_only_main_asset_2(),
              R_Widget.test_png_variant_2(),
            ],
          ),
        ),
      ),
    );
  }
}
