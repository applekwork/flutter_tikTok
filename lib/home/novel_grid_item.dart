import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';

class NovelGridItem extends StatelessWidget{
  final Novel novel;
  NovelGridItem(this.novel);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15 * 2 - 15) / 2;
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNovelDetail(context, novel);
      },
      child: Container(
        width: width,
        child: Row(
          children: <Widget>[
            NovelCoverImage(imageUrl: novel.imgUrl,width: 70,height: 90,),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    novel.name,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15,),
                    Text(novel.recommendCountStr(),
                    style: TextStyle(fontSize: 12,color: ColorPlate.gray))
                ],
              )),
          ],
        ),
      ),
    );
  }
}
