import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/app/userManager.dart';
import 'package:flutter_demo/utility/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/home/home_scene.dart';
import 'package:flutter_demo/me/me_scene.dart';
import 'package:flutter_demo/bookshelf/bookshelf_scene.dart';

class RootScene extends StatefulWidget {
  @override
  _RootSceneState createState() => _RootSceneState();
}

class _RootSceneState extends State<RootScene> {
  int _tabIndex = 0;
  bool isFinishSetUp = false;
  List<Image> _tabImages = [
    Image.asset('assets/images/tab_bookshelf_n.png'),
    Image.asset('assets/images/tab_bookstore_n.png'),
    Image.asset('assets/images/tab_me_n.png')
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('assets/images/tab_bookshelf_p.png'),
    Image.asset('assets/images/tab_bookstore_p.png'),
    Image.asset('assets/images/tab_me_p.png'),
  ];

  @override
  void initState() {
    setupApp();
    super.initState();
    eventBus.on(EventUserLogin, (arg) {
      setState(() {});
    });
    eventBus.on(EventUserLogout, (arg) {
      setState(() {});
    });
    eventBus.on(EventToggleTabBarIndex, (arg) {
      setState(() {
        _tabIndex = arg;
      });
    });
  }

  @override
  void dispose() {
    eventBus.off(EventUserLogin, (arg) {});
    eventBus.off(EventUserLogout, (arg) {});
    eventBus.off(EventToggleTabBarIndex, (arg) {});
    super.dispose();
  }

  setupApp() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isFinishSetUp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (!isFinishSetUp) {
    //   return Container();
    // }
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: IndexedStack(
        children: <Widget>[
          BookshelfScene(),
          HomeScene(),
          MeScene(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: ColorPlate.white,
        activeColor: ColorPlate.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), label: '书架'),
          BottomNavigationBarItem(icon: getTabIcon(1), label: '书城'),
          BottomNavigationBarItem(icon: getTabIcon(2), label: '我的')
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
