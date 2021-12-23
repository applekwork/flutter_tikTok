import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'novel_grid_Item.dart';
import 'home_section_view.dart';
import 'home_novel_cover_view.dart';
import 'home_model.dart';

class NovelSecondHybirdCard extends StatelessWidget {
  final HomeModel cardInfo;
  NovelSecondHybirdCard(this.cardInfo);

  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if (novels == null || novels.length < 5) {
      return Container();
    }

    var topNovels = novels.sublist(0, 4);
    List<Widget> children = [];
    topNovels.forEach((novel) {
      children.add(HomeNovelCoverView(novel: novel));
    });
    var bottomNovels = novels.sublist(4);
    bottomNovels.forEach((novel) {
      children.add(NovelGridItem(novel));
    });
    return Container(
      color: ColorPlate.white,
      child: Column(
        children: <Widget>[
          HomeSectionView(cardInfo.name),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15,runSpacing: 20,children: children),
          ),
          Container(
            height: 10,
            color: Color(0xfff5f5f5),
          )
        ],
      ),
    );
  }
}
