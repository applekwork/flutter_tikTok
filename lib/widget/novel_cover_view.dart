import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/widget/novel_cover_image.dart';

class NovelCoverView extends StatelessWidget {
  final Novel novel;

  const NovelCoverView({Key? key, required this.novel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNovelDetail(context, novel);
      },
      child: Container(
        width: 90,
        margin: EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NovelCoverImage(
              imageUrl: novel.imgUrl,
              width: 90,
              height: 120),
              SizedBox(height: 10),
              Text(
                novel.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
          ],
        ),

      ),
    );
  }
}
