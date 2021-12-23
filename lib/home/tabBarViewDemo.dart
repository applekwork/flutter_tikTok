import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/home/customUnderlineTabIndicator.dart';

class TabBarViewDemo extends StatefulWidget {
  const TabBarViewDemo({Key? key}) : super(key: key);

  @override
  _TabBarViewDemoState createState() => _TabBarViewDemoState();
}

class _TabBarViewDemoState extends State<TabBarViewDemo>
    with SingleTickerProviderStateMixin {
  List tabs = ["分类1", "分类2", "分类3"];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget buildTabBar() {
    return Container(
      height: 56,
      color: ColorPlate.white,
      child: TabBar(
        controller: _controller,
        labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        labelColor: ColorPlate.primary,
        unselectedLabelColor: ColorPlate.back1,
        /*  indicator: CustomUnderlineTabIndicator(
          wantWidth: 80,
          insets: EdgeInsets.only(left: 15,right: 15),
          borderSide: BorderSide(width: 10, color: ColorPlate.primary),
        ), */
        indicatorColor: ColorPlate.primary,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 5,
        indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
        tabs: tabs.map((e) => Tab(text: e)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildTabBar(),
        backgroundColor: ColorPlate.white,
        elevation: 0,
      ),
      body: TabBarView(
        controller: _controller,
        children: tabs.map((e) {
          return Container(
            child: Center(
              child: Text(e),
            ),
          );
        }).toList(),
      ),
    );
  }
}
