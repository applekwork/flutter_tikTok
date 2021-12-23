import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/novel_detail/novel_detail_scene.dart';

class BookshelfItemView extends StatelessWidget {
  final Novel novel;
  const BookshelfItemView({Key? key, required this.novel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15 * 2 - 24 * 2) / 3;
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNovelDetail(context, novel);
      },
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              child: NovelCoverImage(
                imageUrl: novel.imgUrl,
                width: width,
                height: width / 0.75,),
                decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Color(0x22000000), blurRadius: 5)
            ])),
          SizedBox(height: 10),
          Text(novel.name,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1),
            SizedBox(height: 25),
          ],),
      ),
    );
  }
}
