import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CountContainer extends InheritedWidget {
  final _TansferValuePageState? model;
  final Function()? increment;
  // final int? count;
  //方便其子Widget在Widget树中找到它
  static CountContainer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>()
          as CountContainer;
  CountContainer(
      {Key? key,
      @required this.model,
      @required this.increment,
      required Widget child})
      : super(key: key, child: child);
  // 判断是否需要更新
  @override
  bool updateShouldNotify(CountContainer oldWidget) => model!.count != oldWidget.model!.count;
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取InheritedWidget节点
    CountContainer state = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("InheritedWidget传值")),
      body: Text(
        'You have pushed the button this many times: ${state.model!.count}',
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: state.increment), //关联数据修改方法 ); }}
    );
  }
}

class TansferValuePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TansferValuePageState();
  }
}

class _TansferValuePageState extends State<TansferValuePage> {
 int count = 0;
  void _incrementCounter() => setState(() {
        count++;
      });
  @override
  Widget build(BuildContext context) {
    //将CountContainer作为根节点，并使用0作为初始化count
    return Scaffold(
      body: CountContainer(model: this,increment: _incrementCounter,child: Counter()),
    );
  }
}
