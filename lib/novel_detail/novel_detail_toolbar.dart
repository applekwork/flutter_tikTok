import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';

class NovelDetailToolbar extends StatelessWidget {
  final Novel novel;

  const NovelDetailToolbar({Key? key, required this.novel}) : super(key: key);

  read() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 + Screen.bottomSafeHeight,
      padding: EdgeInsets.only(bottom: Screen.bottomSafeHeight),
      decoration: BoxDecoration(
        color: ColorPlate.white,
        boxShadow: Styles.borderShadow,
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Center(
            child: Text(
              '加入书架',
              style: TextStyle(fontSize: 16, color: ColorPlate.primary),
            ),
          )),
          Expanded(
            child:  Container(
              height: 40,
              // padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              decoration: BoxDecoration(
                color: ColorPlate.primary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text('马上阅读',
                    style: TextStyle(color: ColorPlate.white, fontSize: 18)),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text('下载',style: TextStyle(color: ColorPlate.primary,fontSize: 16)),
            ))
        ],
      ),
    );
  }
}
