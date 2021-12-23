import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/public.dart';
import 'home_list_view.dart';

class HomeScene extends StatefulWidget {
  HomeScene({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeSceneState();
  }
}

class _HomeSceneState extends State<HomeScene> {
  List tabs = ["精选", "女生", "男生", "漫画"];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TabBar(
                labelColor: ColorPlate.darkGray,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelColor: ColorPlate.gray,
                indicatorColor: ColorPlate.primary,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                tabs: tabs.map((e) {
                  return Tab(text: e);
                }).toList(),
              ),
            ),
            backgroundColor: ColorPlate.white,
            elevation: 0,
          ),
          body: TabBarView(children: [
            HomeListView(HomeListType.excellent),
            HomeListView(HomeListType.female),
            HomeListView(HomeListType.male),
            HomeListView(HomeListType.cartoon),
          ]),
        ));
  }
}
