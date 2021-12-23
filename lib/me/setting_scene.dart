import 'package:flutter/material.dart';
import 'package:flutter_demo/app/userManager.dart';
import 'package:flutter_demo/public.dart';

class SettingScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    if (UserManager.instance.isLogin) {
      children.add(GestureDetector(
        onTap: () {
          Navigator.pop(context);
          UserManager.instance.logout();
        },
        child: Container(
          height: 50,
          color: ColorPlate.white,
          child: Center(
            child: Text(
              '退出登录',
              style: StandardTextStyle.normal.apply(color: ColorPlate.orange),
            ),
          ),
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(title: Text('设置'),),
      body: Container(
        child: ListView(
          children: children,
        ),
      ),
    );
  }
}
