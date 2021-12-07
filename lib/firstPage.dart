import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'secondPage.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    return Scaffold(
      // appBar: AppBar(title: Text("FirstPage")),
      body: Text("Counter: ${_counter.counter}"),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondPage()))
        )
        );
  }
}

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get counter => _count;
  void increment() {
    _count++;
    notifyListeners(); //通知听众刷新
  }
}
