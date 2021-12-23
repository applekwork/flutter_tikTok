import 'package:flutter/material.dart';
import 'package:flutter_demo/home/home_model.dart';
import 'package:flutter_demo/public.dart';
import 'home_section_view.dart';
import 'home_novel_cover_view.dart';

class NovelFourGridView extends StatelessWidget {
  final HomeModel cardInfo;

  NovelFourGridView(this.cardInfo);

  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if (novels == null || novels.length == 0) {
      return SizedBox();
    }
    var children = novels.map((novel) {
      return HomeNovelCoverView(
        novel: novel,
      );
    }).toList();
    return Container(
      color: ColorPlate.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeSectionView(cardInfo.name),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15,runSpacing: 20,children: children),
          ),
          Container(
            height: 10,
            color: Color(0xfff5f5f5)
          )
        ],
      ),
    );
  }
}
