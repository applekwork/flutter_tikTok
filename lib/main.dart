import 'package:flutter_demo/controller/appPage.dart';
import 'package:flutter_demo/style/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/secondScreen.dart';
import 'package:flutter_demo/listViewPage.dart';
import 'package:flutter_demo/userInteraction.dart';
import 'package:flutter_demo/tansferValuePage.dart';
import 'package:flutter_demo/customNotification.dart';
import 'package:flutter_demo/eventBusPage.dart';
import 'package:flutter_demo/animationPage.dart';
import 'package:flutter_demo/heroAnimation.dart';
import 'package:flutter_demo/heroNextAnimation.dart';
import 'package:flutter_demo/httpRequestPage.dart';
import 'package:flutter_demo/provider.dart';

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
