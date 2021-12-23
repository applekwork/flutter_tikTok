import 'package:flutter/widgets.dart';
import 'package:flutter_demo/utility/screen.dart';

afterLayout(VoidCallback callback) {
  WidgetsBinding.instance!.addPostFrameCallback((Duration timeStamp) {
    callback();
  });
}

fixedFontSize(double fontSize) {
  return fontSize / Screen.textScaleFactor;
}
