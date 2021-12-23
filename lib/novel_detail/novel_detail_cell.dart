import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';

class NovelDetailCell extends StatelessWidget {
  final String iconName;
  final String title;
  final String subTitle;
  final Widget? attachedWidget;

  const NovelDetailCell(
      {Key? key,
      required this.iconName,
      required this.title,
      required this.subTitle,
      this.attachedWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPlate.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: <Widget>[
          Divider(height: .5, thickness: .5, color: ColorPlate.gray),
          Container(
            height: 50,
            child: Row(
              children: <Widget>[
                Image.asset(iconName),
                SizedBox(width: 10),
                Text(title,style: TextStyle(fontSize: 16)),
                Expanded(
                  child: Text(
                    subTitle,
                    style: TextStyle(fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  attachedWidget ?? Container(),
                  SizedBox(width: 10),
                  Image.asset('assets/images/arrow_right.png'),
              ],
            ),
          ),
          Divider(height: .5, thickness: .5, color: ColorPlate.gray),
        ],
      ),
    );
  }
}
