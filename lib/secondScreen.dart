import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'eventBusPage.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("SecondScreen"),
        ),
        body: Column(
          children: <Widget>[
            FloatingActionButton(
                child: Text("返回按钮"),
                onPressed: () => {
                      Navigator.popAndPushNamed(context, "eventBus_Page",
                          arguments: "pop返回传参")
                    }),
            RaisedButton(
                child: Text('Fire Event'),
                // 触发CustomEvent事件
                onPressed: () => eventBus.fire(CustomEvent("hello")))
          ],
        ));
  }
}
