import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/example/countProviderModel.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

//1.局部刷新（单组件/单页面内部状态）组件内共享
class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //单数据共享
    return ChangeNotifierProvider<CountProviderModel>(
        create: (_) => CountProviderModel(),
        builder: (context, child) {
          return Scaffold(
            appBar: AppBar(title: Text("Provider局部刷新（单组件/单页面内部状态）")),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have pushed the button this many times:'),
                  Consumer<CountProviderModel>(
                    builder: (context, countModel, child) {
                      return Text("${countModel.counter}");
                    },
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => context.read<CountProviderModel>().increment(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        });
    //多数据共享
    // return MultiProvider(
    //     providers: [
    //       Provider.value(value: 30.0),
    //       ChangeNotifierProvider.value(value: CounterModel())
    //     ],
    //     child: Scaffold(
    //       appBar: AppBar(title: Text('Provider')),
    //       body: FirstPage(),
    //     ),
    //     );
  }
}