import 'package:flutter/material.dart';
import 'package:flutter_demo/utility/styles.dart';

enum MeCellTag{
  setting,
}

class MeCell extends StatelessWidget {

  final VoidCallback? onTap;
  final String iconName;
  final String title;

  const MeCell(
      {Key? key, required this.iconName, required this.title, this.onTap})
      : super(key: key);

      @override
      Widget build(BuildContext context) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  color: ColorPlate.white,
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(children: <Widget>[
                    Image.asset(iconName),
                    SizedBox(width: 20),
                    Text(title,style: StandardTextStyle.normal.apply(color: ColorPlate.back1)),
                    Expanded(child: Container()),
                    Image.asset('assets/images/arrow_right.png')
                  ],),
                ),
                Container(
                  height: 1,
                  color:ColorPlate.lightGray,
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                ),
              ],
            ),
          ),
        );
      }
}
