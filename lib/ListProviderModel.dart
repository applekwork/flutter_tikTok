import 'package:flutter/material.dart';

// Provider多Model全局共享
class ListProviderModel extends ChangeNotifier {
  List<String> _list = [];

  List<String> get lister => _list;

  void push(String value) {
    _list.add(value);
    notifyListeners();
  }
}
