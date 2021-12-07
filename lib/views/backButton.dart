import 'package:flutter/material.dart';
import 'package:tapped/tapped.dart';

//自定义导航栏返回按钮
class IosBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tapped(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.white.withOpacity(0),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
      ),
    );
  }
}
