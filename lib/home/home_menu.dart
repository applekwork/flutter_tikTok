import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'home_model.dart';

class HomeMenu extends StatelessWidget {
  final List<MenuInfo> infos;
  HomeMenu(this.infos);

  Widget buildItem(MenuInfo info) {
    return Column(
      children: <Widget>[
        Image.asset(info.icon,fit: BoxFit.cover,width: 40,height: 40),
        SizedBox(height: 5),
        Text(info.title,
            style: TextStyle(fontSize: 12, color: ColorPlate.gray)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPlate.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: infos.map((info) {
          return buildItem(info);
        }).toList(),
      ),
    );
  }
}
