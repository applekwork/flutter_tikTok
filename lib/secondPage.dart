import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/firstPage.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //取出资源
    // final _counter = Provider.of<CounterModel>(context);//获取计时器实例
    // final textSize = Provider.of<double>(context); //获取字体大小

//使用Consumer2获取两个数据资源
    Consumer2<CounterModel, double>(
        builder: (context, CounterModel counter, double textSize, _) => Text(
            'Value: ${counter.counter}',
            style: TextStyle(fontSize: textSize)));
    return Scaffold(
        appBar: AppBar(title: Text("")),
        body: Consumer<CounterModel>(
            builder: (context, CounterModel counter, _) =>
                Text('Counter: ${counter.counter}')),
        floatingActionButton: Consumer<CounterModel>(
          builder: (context, CounterModel counter, child) =>
              FloatingActionButton(
            onPressed: counter.increment,
            child: child,
          ),
          child: TestIcon(),
        ));
  }
}

class TestIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("TestIcon build");
    return Icon(Icons.add);
  }
}
