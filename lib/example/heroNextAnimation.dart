import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class HeroNextAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero第二个页面")),
      body: Hero(
        tag: 'hero',
        child: Container(
          width: 300,
          height: 300,
          child: FlutterLogo(),
        ),
      )
    );
  }
}
