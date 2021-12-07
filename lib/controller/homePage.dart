import 'package:flutter_demo/views/tikTokheader.dart';
import 'package:flutter_demo/views/tiktokTabBar.dart';
import 'package:flutter_demo/views/tikTokScaffoldController.dart';
import 'package:flutter_demo/controller/FollowPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safemap/safemap.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  TikTokPageTag tabBarType = TikTokPageTag.home;
  TikTokScaffoldController tkController = TikTokScaffoldController();
  PageController _pageController = PageController();

  var header;

  @override
  Widget build(BuildContext context) {
    Widget? currentPage;

    switch (tabBarType) {
      case TikTokPageTag.home:
        break;
      case TikTokPageTag.follow:
        currentPage = FollowPage();
        break;
      case TikTokPageTag.msg:
        // TODO: Handle this case.
        break;
      case TikTokPageTag.me:
        // TODO: Handle this case.
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
    // 组合
    return TikTokScaffold(
      controller: tkController,
      hasBottomPadding: hasBackground,
      tabBar: tikTokTabBar,
      header: null,
      leftPage: null,
      rightPage: null,
      page: currentPage ?? Container()
      );
  }
}
