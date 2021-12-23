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
import 'package:flutter_demo/example/providerPageTwo.dart';
import 'package:flutter_demo/example/countProviderModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:flutter_demo/example/listProviderModel.dart';
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
  // runApp(ChangeNotifierProvider(
  //   create: (_) => CountProviderModel(),
  //   child: MyApp(),
  // ));
  runApp(
    // 多个 Model 需要全局共享时，需要用 MultiProvider 包一层
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProviderModel()),
        ChangeNotifierProvider(create: (_) => ListProviderModel()),
      ],
      child: MyApp(),
    ),
  );
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
        "tansferValue_Page": (context) => TansferValuePage(),//inheritedWidget传值
        "customNotification_Page": (context) => CustomNotificationPage(),//Notification传值
        "eventBus_Page": (context) => EventBusPage(),//EventBus传值
        "secondScreen_Page": (context) => SecondScreen(),
        "animation_Page": (context) => AnimationPage(),
        "heroAnimation_Page": (context) => HeroAnimation(),
        "heroNextAnimation_Page": (context) => HeroNextAnimation(),
        "httpRequest_Page": (context) => HttpRequestPage(),
        "provider_Page": (context) => ProviderPage(),
        "providerTwo_Page": (context) => ProviderPageTwo(),
      },
    );
  }
}
