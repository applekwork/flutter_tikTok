import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'novel_cell.dart';
import 'home_section_view.dart';
import 'home_model.dart';
import 'novel_grid_Item.dart';

class NovelFirstHybridCard extends StatelessWidget {
  final HomeModel cardInfo;

  NovelFirstHybridCard(this.cardInfo);

  @override
  Widget build(BuildContext context) {
    var novels = cardInfo.books;
    if (novels == null || novels.length == 0) {
      return Container();
    }

    List<Widget> children = [];
    var bottomNovels = novels.sublist(1);
    bottomNovels.forEach((novel) {
      children.add(NovelGridItem(novel));
    });
    return Container(
      color: ColorPlate.white,
      child:  Column(
        children: <Widget>[
          HomeSectionView(cardInfo.name),
          NovelCell(novels[0]),
          Container(
             padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
             child: Wrap(spacing: 15, runSpacing: 15, children: children),
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
