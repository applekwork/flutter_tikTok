// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/example/listViewPage.dart';
import 'package:flutter_demo/example/userInteraction.dart';
import 'package:flutter_demo/example/tansferValuePage.dart';
import 'package:flutter_demo/example/customNotification.dart';

class UnknownPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("路由错误")),
      body: Center(child: Text("路由名字错误")),
    );
  }
}

class HomePageController extends StatelessWidget with ChangeNotifierProvider {
  final List dataArr = <String>[
    "ListView",
    "UserInteraction",
    "InheritedWidget",
    "Notification",
    "Event_bus",
    "Animation",
    "HeroAnimation",
    "HttpRequest",
    "Provider局部刷新（单组件/单页面内部状态）",
    "Provider全局刷新（页面/组件状态共享）",
  ];

  void pushToNextController(String title) {
    if (title == "listView页") {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("首页"),
      //   leading: Text(""),
      //   // leading: IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
      //   automaticallyImplyLeading: true,
      //   // actions: <Widget>[
      //   //   IconButton(icon: Icon(Icons.ac_unit) ,onPressed: (){})
      //   // ],
      // ),
      body: ListView.builder(
        itemCount: dataArr.length,
        itemExtent: 54,
        itemBuilder: (BuildContext context, int index) {
          TextStyle textStyle = TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue);
          return GestureDetector(
              onTap: () {
                String itemStr = dataArr[index];
                if (itemStr == "ListView") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListViewPage()));
                } else if (itemStr == "UserInteraction") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserInteraction()));
                } else if (itemStr == "InheritedWidget") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TansferValuePage()));
                } else if (itemStr == "Notification") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomNotificationPage()));
                } else if (itemStr == "Event_bus") {
                  //命名路由传递参数
                  Navigator.pushNamed(context, "eventBus_Page",
                      arguments: "Hey");
                } else if (itemStr == "Animation") {
                  Navigator.pushNamed(context, "animation_Page");
                } else if (itemStr == "HeroAnimation") {
                  Navigator.pushNamed(context, "heroAnimation_Page");
                } else if (itemStr == "HttpRequest") {
                  Navigator.pushNamed(context, "httpRequest_Page");
                } else if (itemStr == "DataPersistence") {
                  Navigator.pushNamed(context, "dataPersistence_Page");
                } else if (itemStr == "Provider局部刷新（单组件/单页面内部状态）") {
                  Navigator.pushNamed(context, "provider_Page");
                } else if (itemStr == 'Provider全局刷新（页面/组件状态共享）') {
                  Navigator.pushNamed(context, "providerTwo_Page");
                }
              },
              child: Center(
                child: Text(dataArr[index], style: textStyle),
              ));
        },
      ),
    );
  }
}

mixin ChangeNotifierProvider {}

/*
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  void buttonClickAction() {
    setState(() {
      count += 1;
      Future(() => print("Future 1")).then((value) {
        scheduleMicrotask(()  {
          print("Future 2");
        });
      });
      Future(() => print("Futrue 3"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        onPressed: buttonClickAction,
        child: Container(
          height: 40,
          width: 100,
          alignment: Alignment.center,
          child: Text('点击了' + '$count' + '次'),
        ),
      ),
    );
  }
}
*/