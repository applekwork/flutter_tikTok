import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/me/me_cell.dart';
import 'package:flutter_demo/me/me_header.dart';
import 'package:flutter_demo/me/login_scene.dart';
import 'package:flutter_demo/me/setting_scene.dart';

class MeScene extends StatelessWidget {
  const MeScene({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget buildCells(BuildContext ctx) {
      return Container(
        child: Column(
          children: <Widget>[
            MeCell(iconName: 'assets/images/me_wallet.png', title: '钱包'),
            MeCell(iconName: 'assets/images/me_record.png', title: '消费充值记录'),
            MeCell(iconName: 'assets/images/me_buy.png', title: '购买的书'),
            MeCell(iconName: 'assets/images/me_vip.png', title: '我的会员'),
            MeCell(iconName: 'assets/images/me_coupon.png', title: '绑兑换码'),
            MeCell(
              iconName: 'assets/images/me_setting.png',
              title: '设置',
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScene()
                ));
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark,
        child: Container(
          color: ColorPlate.white,
          child: ListView(
            children: <Widget>[
              MeHeader(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder:(BuildContext ctx) => LoginScene()));
                },
              ),
              SizedBox(height: 10),
              buildCells(context),
            ],
          ),
        ),
      ),
    );
  }
}
