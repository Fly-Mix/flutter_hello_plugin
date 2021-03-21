import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_hello_plugin/flutter_hello_plugin.dart' as Hello;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello Plugin Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Hello Plugin Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      platformVersion = await Hello.HelloPlugin.platformVersion;
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

  void _alertMessage(String message) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return new CupertinoAlertDialog(
            content: Text(
              "$message",
              textAlign: TextAlign.justify,
            ),
            actions: <Widget>[
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop("点击了确定");
                },
                child: Text("确定"),
              ),
            ],
          );
        });
  }

  void _readTestJson() async {
    var rawString = await Hello.R.text.test_json();
    _alertMessage(rawString);
  }

  void _readTestYaml() async {
    var rawString = await Hello.R.text.test_yaml();
    _alertMessage(rawString);
  }

  @override
  Widget build(BuildContext context) {
    var nonImpliedImageWidget_1 = Image(
      image: Hello.R.image.test_only_main_asset_1(),
      width: 100,
      height: 100,
    );

    var nonImpliedImageWidget_2 = Image(
      image: Hello.R.image.test_png_variant_1(),
      width: 100,
      height: 100,
    );

    var impliedImageWidget_1 = Image(
      image: Hello.R.image.test_only_main_asset_2(),
      width: 100,
      height: 100,
    );

    var impliedImageWidget_2 = Image(
      image: Hello.R.image.test_png_variant_2(),
      width: 100,
      height: 100,
    );

    var amiri_TextWidget = Text("test Amiri 字体",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: Hello.R.fontFamily.amiri,
            package: Hello.R.package,
            fontWeight: FontWeight.bold));

    var baloo_Thambi_2_TextWidget = Text("test Baloo_Thambi_2 字体",
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: Hello.R.fontFamily.baloo_Thambi_2, package: Hello.R.package));

    var liu_Jian_Mao_Cao_TextWidget = Text("test Liu_Jian_Mao_Cao 字体",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: Hello.R.fontFamily.liu_Jian_Mao_Cao,
          package: Hello.R.package,
          fontStyle: FontStyle.normal,
        ));

    var dan_Zhai_Hang_Shu_Cai_TextWidget = Text("test Dan_Zhai_Hang_Shu_Cai 字体",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: Hello.R.fontFamily.dan_Zhai_Hang_Shu_Cai,
            package: Hello.R.package,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w900));

    var github_IconWidget = Icon(_YorkFishIconData.github, color: Colors.blue);
    var newYork_IconWidget = Icon(_YorkFishIconData.newYork, color: Colors.red);
    var fish_IconWidget = Icon(_YorkFishIconData.fish, color: Colors.blue);

    var sun_IconWidget = Icon(_SkyIconData.sun, color: Colors.blue);
    var moon_IconWidget = Icon(_SkyIconData.moon, color: Colors.red);
    var stars_IconWidget = Icon(_SkyIconData.stars, color: Colors.blue);

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
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
            Text(
              "--- Test Image Resource ---",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: Hello.R.fontFamily.lobster,
                  package: Hello.R.package,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w900),
            ),
            nonImpliedImageWidget_1,
            nonImpliedImageWidget_2,
            impliedImageWidget_1,
            impliedImageWidget_2,
            Text(
              "--- Test Text Resource ---",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: Hello.R.fontFamily.lobster,
                  package: Hello.R.package,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w900),
            ),
            CupertinoButton(
              child: Text(
                "read  test.json",
              ),
              onPressed: _readTestJson,
            ),
            CupertinoButton(
              child: Text(
                "read  test.yaml",
              ),
              onPressed: _readTestYaml,
            ),
            Text(
              "--- Test Font Resource ---",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: Hello.R.fontFamily.pacifico,
                  package: Hello.R.package,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w900),
            ),
            amiri_TextWidget,
            baloo_Thambi_2_TextWidget,
            liu_Jian_Mao_Cao_TextWidget,
            dan_Zhai_Hang_Shu_Cai_TextWidget,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[github_IconWidget, newYork_IconWidget, fish_IconWidget],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[sun_IconWidget, moon_IconWidget, stars_IconWidget],
            ),
            Text(
              "--- Ending ---",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: Hello.R.fontFamily.pacifico,
                  package: Hello.R.package,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _YorkFishIconData {
  static String fontFamily = Hello.R.fontFamily.yorkFish_IconFont;
  static String fontPackage = Hello.R.package;

  // the unicode of icon see: lib/assets/fonts/YorkFish_IconFont/iconfont.json

  // github
  static IconData github =
      IconData(0xe628, fontFamily: fontFamily, fontPackage: fontPackage, matchTextDirection: true);

  // new york
  static IconData newYork =
      IconData(0xe648, fontFamily: fontFamily, fontPackage: fontPackage, matchTextDirection: true);

  // fish
  static IconData fish =
      IconData(0xefd7, fontFamily: fontFamily, fontPackage: fontPackage, matchTextDirection: true);
}

class _SkyIconData {
  static String fontFamily = Hello.R.fontFamily.sky_IconFont;
  static String fontPackage = Hello.R.package;

  // the unicode of icon see: assets/fonts/Sky_IconFont/iconfont.json

  // sun
  static IconData sun =
      IconData(0xe659, fontFamily: fontFamily, fontPackage: fontPackage, matchTextDirection: true);

  // moon
  static IconData moon =
      IconData(0xe6c3, fontFamily: fontFamily, fontPackage: fontPackage, matchTextDirection: true);

  // stars
  static IconData stars =
      IconData(0xe63d, fontFamily: fontFamily, fontPackage: fontPackage, matchTextDirection: true);
}
