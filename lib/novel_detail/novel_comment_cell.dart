import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'package:cached_network_image/cached_network_image.dart';
class NovelCommentCell extends StatelessWidget {
  final NovelComment comment;
  const NovelCommentCell({Key? key, required this.comment}) : super(key: key);

  Widget buildButton(
      String imageStr, String title, VoidCallback onPress, bool isSelected) {
    return Row(
      children: <Widget>[
        Image.asset(imageStr),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(
              fontSize: 14,
              color: isSelected ? Color(0xfff5a623) : ColorPlate.gray),
        ),
      ],
    );
  }

  Widget buildContent() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 13,
                backgroundImage: CachedNetworkImageProvider(comment.avatar),
              ),
              SizedBox(width: 10),
              Text(comment.nickname,
                  style: TextStyle(fontSize: 14, color: ColorPlate.gray)),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(36, 15, 15, 0),
            child: Text(comment.content,style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        buildContent(),
        Divider(
            indent: 15,
            endIndent: 15,
            color: ColorPlate.gray,
            height: 0.25,
            thickness: 0.25),
      ],
    );
  }
}
