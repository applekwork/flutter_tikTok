import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firstPage.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //单个数据共享
    // return ChangeNotifierProvider.value(
    //     value: CounterModel(),
    //     child: Scaffold(
    //       appBar: AppBar(title: Text("Provider")),
    //       body: MaterialApp(
    //         home: FirstPage(),
    //       ),
    //     ));
    //多数据共享
    return MultiProvider(
        providers: [
          Provider.value(value: 30.0),
          ChangeNotifierProvider.value(value: CounterModel())
        ],
        child: Scaffold(
          appBar: AppBar(
          title: Text("多数据共享"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: FirstPage()));
        // child: MaterialApp(
        //   home: FirstPage(),
        // ));
  }
}
