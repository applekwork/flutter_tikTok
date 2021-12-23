import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListDemo"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemExtent: 150,
              itemBuilder: (BuildContext context, int index) {
                // return Container(color: Colors.green, height: 200);
                return MyHomePage();
              },
            )));
  }
}

class MyHomePage extends StatelessWidget {
  final UpdateItemModel model = UpdateItemModel(
      appIcon: "assets/images/icon.png",
      appName: "Google Ma",
      appSize: "107M",
      appDate: "2021年11月11日",
      appDescription:
          "Thanks for using Google Maps Thanks for using Google Maps",
      appVersion: "6.0.0");
  Widget buildTopView(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/icon.png"),
                  fit: BoxFit.cover),
              // border: Border.all(color: Colors.red,width: 2),
              borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          color: Colors.yellow,
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.appName!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(model.appDate!,
                  style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTopView(context);
  }
}

class UpdateItemModel {
  final String? appIcon;
  final String? appName;
  final String? appSize;
  final String? appDate;
  final String? appDescription;
  final String? appVersion;
  UpdateItemModel(
      {this.appIcon,
      this.appName,
      this.appSize,
      this.appDate,
      this.appDescription,
      this.appVersion});
}
