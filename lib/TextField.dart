import 'package:flutter/material.dart';

class TextFieldPage extends StatelessWidget {
  TextFieldPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TextField")), body: TextField());
  }
}
