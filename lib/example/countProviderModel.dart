import 'package:flutter/material.dart';

class CountProviderModel extends ChangeNotifier {
  int _count = 0;
  //读方法CountProviderModelb
  int get counter => _count;
  //写方法
  void increment() {
    _count++;
    notifyListeners(); //通知听众刷新
    /*可以看到，我们在资源封装类中使用 mixin 混入了 ChangeNotifier。这个类能够帮助我们管理所有依赖资源封装类的听众。当资源封装类调用 notifyListeners 时，它会通知所有听众进行刷新。 */
  }
}
