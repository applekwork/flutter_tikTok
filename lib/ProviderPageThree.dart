import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:flutter_demo/CountProviderModel.dart';
import 'package:flutter_demo/ListProviderModel.dart';

//2.2全局刷新（页面/组件状态共享）组件间数据共享
class ProviderPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderPageThree"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Consumer<CountProviderModel>(
              builder: (context, notifier, child) {
                return Text("${notifier.counter}");
              },
            ),
            Consumer<ListProviderModel>(
                builder: (BuildContext ctx, ListProviderModel notifier, child) {
                   return Text("${notifier.lister}");
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Provider.of<CountProviderModel>(context, listen: false).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
