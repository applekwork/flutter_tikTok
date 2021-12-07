import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomNotification extends Notification {
  CustomNotification(this.msg);
  final String msg;
}

class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () => CustomNotification("hi").dispatch(context),
        child: Text("发送通知"));
  }
}

class CustomNotificationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _CustomNotificationPageState();
  }
}

class _CustomNotificationPageState extends State<CustomNotificationPage> {
  String _msg = "通知来了";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Notification传值")),
        body: NotificationListener<CustomNotification>(
          onNotification: (notification) {
            setState(() {
              _msg += notification.msg;
            });
            throw UnimplementedError();
          },
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[Text(_msg), CustomChild()],
          )),
        ));
  }
}
