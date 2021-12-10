import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:event_bus/event_bus.dart';

class CustomEvent {
  String msg;
  CustomEvent(this.msg);
}

//建立公共的event
EventBus eventBus = new EventBus();

class EventBusPage extends StatefulWidget {
  @override
  _EventBusPageState createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  String msg = "收到:";
  late final StreamSubscription subscription;
  @override
  void initState() {
    //监听CustomEvent事件，刷新UI
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        msg += event.msg;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //通过路由接受参数
    String message = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text("Event_bus")),
      body: Text(msg + message),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()))
                Navigator.pushNamed(context, "secondScreen_Page",
                        arguments: "hi")
                    .then((value) {
                  setState(() {
                    String str = value as String;
                    msg += str;
                  });
                })
              }),
    );
  }
}
