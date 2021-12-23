import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';

class NovelCell extends StatelessWidget {
  final Novel novel;

  NovelCell(this.novel);

  Widget buildTag(String title, Color color) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
      decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromARGB(99, color.red, color.green, color.blue),
              width: 0.5)),
      child: Text(
        title,
        style: TextStyle(fontSize: 11, color: color),
      ),
    );
  }

  Widget buildRightView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          novel.name,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          novel.introduction,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: ColorPlate.gray),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            Text(
              novel.author,
              style: TextStyle(fontSize: 14, color: ColorPlate.gray),
            ),
            Expanded(child: Container()),
            buildTag(novel.status, novel.statusColor()),
            SizedBox(
              width: 5,
            ),
            buildTag(novel.type, ColorPlate.gray),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNovelDetail(context, novel);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NovelCoverImage(imageUrl: novel.imgUrl, width: 70, height: 90),
            SizedBox(width: 15),
            Expanded(child: buildRightView()),
          ],
        ),
      ),
    );
  }
}
