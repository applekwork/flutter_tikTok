import 'package:flutter_demo/controller/appPage.dart';
import 'package:flutter_demo/utility/styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/example/secondScreen.dart';
import 'package:flutter_demo/example/listViewPage.dart';
import 'package:flutter_demo/example/userInteraction.dart';
import 'package:flutter_demo/example/tansferValuePage.dart';
import 'package:flutter_demo/example/customNotification.dart';
import 'package:flutter_demo/example/eventBusPage.dart';
import 'package:flutter_demo/example/animationPage.dart';
import 'package:flutter_demo/example/heroAnimation.dart';
import 'package:flutter_demo/example/heroNextAnimation.dart';
import 'package:flutter_demo/example/httpRequestPage.dart';
import 'package:flutter_demo/example/providerPageOne.dart';

void main() {
  /// 自定义报错页面
  if (kReleaseMode) {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      debugPrint(flutterErrorDetails.toString());
      return Material(
        child: Center(
            child: Text(
          "发生了没有处理的错误\n请通知开发者",
          textAlign: TextAlign.center,
        )),
      );
    };
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tiktok',
      theme: ThemeData(
        brightness: Brightness.dark,
        hintColor: Colors.white,
        accentColor: Colors.white,
        primaryColor: ColorPlate.orange,
        primaryColorBrightness: Brightness.dark,
        scaffoldBackgroundColor: ColorPlate.back1,
        dialogBackgroundColor: ColorPlate.back2,
        accentColorBrightness: Brightness.light,
        textTheme: TextTheme(
          bodyText1: StandardTextStyle.normal,
        ),
      ),
      home: AppPage(),
       routes: {
        "listView_Page": (context) => ListViewPage(),
        "userInteraction_Page": (context) => UserInteraction(),
        "tansferValue_Page": (context) => TansferValuePage(),
        "customNotification_Page": (context) => CustomNotificationPage(),
        "eventBus_Page": (context) => EventBusPage(),
        "secondScreen_Page": (context) => SecondScreen(),
        "animation_Page": (context) => AnimationPage(),
        "heroAnimation_Page": (context) => HeroAnimation(),
        "heroNextAnimation_Page": (context) => HeroNextAnimation(),
        "httpRequest_Page": (context) => HttpRequestPage(),
        "provider_Page": (context) => ProviderPage(),
      },
    );
  }
}
