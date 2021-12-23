import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/app/root_scene.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ColorPlate.white,
        dividerColor: ColorPlate.dividerColor,
        scaffoldBackgroundColor: ColorPlate.paper,
        textTheme: TextTheme(bodyText1: TextStyle(color: ColorPlate.lightGray))
      ),
      home: RootScene(),
    );
  }
}
