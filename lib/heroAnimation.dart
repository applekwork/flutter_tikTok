import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("HeroAnimation")),
        body: GestureDetector(
          child: Hero(
            tag: 'hero',
            child: Container(
              width: 100,
              height: 100,
              child: FlutterLogo(),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "heroNextAnimation_Page");
          },
        ));
  }
}
