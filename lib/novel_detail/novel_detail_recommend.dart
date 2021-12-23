import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/home/home_novel_cover_view.dart';

class NovelDetailRecommend extends StatelessWidget {
  final List<Novel> novels;

  const NovelDetailRecommend({Key? key, required this.novels})
      : super(key: key);

  Widget buildItems() {
    var children =
        novels.map((novel) => HomeNovelCoverView(novel: novel)).toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(spacing: 15,runSpacing: 20,children: children),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorPlate.white,
      padding: EdgeInsets.fromLTRB(0 , 0, 0, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Image.asset('assets/images/home_tip.png'),
                SizedBox(width: 15),
                Text('看过本书的人还在看',style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          buildItems(),
        ],
      ),
    );
  }
}
