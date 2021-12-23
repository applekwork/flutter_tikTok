import 'dart:math';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';
import 'package:flutter_demo/example/providerPageThree.dart';
import 'package:flutter_demo/example/countProviderModel.dart';
import 'package:flutter_demo/example/listProviderModel.dart';

//2.1全局刷新（页面/组件状态共享）组件间数据共享
class ProviderPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProviderPageTwo"),
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 扩展 BuildContext，添加 read 方法，具体看附录
          // context.read<T> 实际调用的是 Provider.of<T>
          context
              .read<CountProviderModel>().increment();
          context
              .read<ListProviderModel>()
              .push('kwok-${Random().nextInt(10)}');
          // 2秒后跳转至新的页面
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return ProviderPageThree();
            }));
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
