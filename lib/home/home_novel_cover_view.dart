import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';

class HomeNovelCoverView extends StatelessWidget {
  final Novel novel;
  HomeNovelCoverView({Key? key, required this.novel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15 * 2 - 15 * 3) / 4;
    return GestureDetector(
      onTap: () {
        // AppNavigator.pushNovelDetail(context, novel);
      },
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NovelCoverImage(imageUrl: novel.imgUrl),
            SizedBox(height: 5),
            Text(
              novel.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            SizedBox(height: 3),
            Text(
              novel.author,
              style: TextStyle(fontSize: 12,color: ColorPlate.gray),
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
