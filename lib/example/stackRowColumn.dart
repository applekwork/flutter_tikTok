import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

// 单子widget 和 多子widget 层叠widget Stack positioned
class ColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row")),
      body: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(color: Colors.red, width: 0, height: 80)),
          Expanded(
              flex: 1,
              child: Container(color: Colors.blue, width: 0, height: 80)),
          Expanded(
              flex: 1,
              child: Container(color: Colors.orange, width: 0, height: 80)),
          Expanded(
              flex: 1,
              child: Container(color: Colors.green, width: 0, height: 80))
        ],
      ),
    );
  }
}
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StackDemo')),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.yellow,
            width: 200,
            height: 200,
          ),
          Positioned(
              left: 5,
              top: 5,
              child: Container(
                color: Colors.green,
                height: 50,
                width: 50,
              )),
          Positioned(
              top: 10,
              left: 10,
              child: Container(
                color: Colors.red,
                height: 50,
                width: 50,
              ))
        ],
      ),
    );
  }
}
class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row")),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(color: Colors.red, width: 60, height: 80),
          Container(color: Colors.blue, width: 100, height: 180),
          Container(color: Colors.orange, width: 60, height: 80),
          Container(color: Colors.green, width: 160, height: 80)
        ],
      ),
    );
  }
}

class CenterDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Center"),
        ),
        body: Container(
          // child: Center(child: Text('Center')),
          alignment: Alignment.topLeft,
          child: Text('Center'),
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.all(44),
          width: 180,
          height: 240,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}

class PaddingDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Padding')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外'),
      ),
    );
  }
}

class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Container（容器）在UI框架中是一个很常见的概念，Flutter也不例外',
            style: TextStyle(color: Colors.white)),
        padding: EdgeInsets.all(18),
        margin: EdgeInsets.all(40),
        width: 90,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
