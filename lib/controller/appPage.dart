import 'package:flutter_demo/views/tikTokTabBar.dart';
import 'package:flutter_demo/controller/followPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/userPage.dart';
import 'package:flutter_demo/controller/messagePage.dart';
import 'package:flutter_demo/controller/homePage.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with WidgetsBindingObserver {
  TikTokPageTag tabBarType = TikTokPageTag.home;
  String? title;

  @override
  Widget build(BuildContext context) {
    Widget? currentPage;

    switch (tabBarType) {
      case TikTokPageTag.home:
        title = '首页';
        currentPage = HomePageController();
        break;
      case TikTokPageTag.follow:
        title = '关注';
        currentPage = FollowPage();
        break;
      case TikTokPageTag.msg:
        title = '消息';
        currentPage = MessagePage();
        break;
      case TikTokPageTag.me:
        title = '我的';
        currentPage = UserPage(isSelfPage: true);
        break;
    }
    double a = MediaQuery.of(context).size.aspectRatio;
    bool hasBottomPadding = a < 0.55;
    bool hasBackground = hasBottomPadding;
    hasBackground = tabBarType != TikTokPageTag.home;
    if (hasBottomPadding) {
      hasBackground = true;
    }
    //底部tabBar
    Widget tikTokTabBar = TikTokTabBar(
        hasBackground: hasBackground,
        current: tabBarType,
        onTabSwitch: (type) async {
          setState(() {
            tabBarType = type;
          });
        });

    return Scaffold(
      appBar: (tabBarType != TikTokPageTag.me)
          ? AppBar(title: Text(title ?? ''))
          : null,
      body: Container(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          currentPage,
          tikTokTabBar
        ],
      )),
    );
  }
}
