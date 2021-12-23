import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';

class HomeSectionView extends StatelessWidget {
  final String title;

  HomeSectionView(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPlate.white,
      padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
      child: Row(
        children: <Widget>[
          Image.asset('assets/images/home_tip.png'),
          SizedBox(width: 10),
          Text('$title',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
