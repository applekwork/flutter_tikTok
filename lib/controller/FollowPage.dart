import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:safemap/safemap.dart';
import 'package:tapped/tapped.dart';
import 'package:flutter_demo/style/style.dart';

class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  Map<int, bool> fMap = {};
  int select = 0;
  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      padding:
          EdgeInsets.only(bottom: 80 + MediaQuery.of(context).padding.bottom),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return FollowRow();
      },
    );
    return Container(
      color: ColorPlate.black,
      height: double.infinity,
      width: double.infinity,
      child: body,
    );
  }
}

class FollowRow extends StatelessWidget {
  final bool? isFavorite;
  final Function? onFavorite;
  final Function? onComment;
  final Function? onShare;
  final Function? onAddFavorite;

  const FollowRow(
      {Key? key,
      this.isFavorite,
      this.onFavorite,
      this.onComment,
      this.onShare,
      this.onAddFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget userInfo = Row(
      children: <Widget>[
        Container(
          height: 32,
          width: 32,
          child: ClipOval(
            child: Image.network(
                'https://t7.baidu.com/it/u=4162611394,4275913936&fm=193&f=GIF',
                fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text('科技改变生活', style: StandardTextStyle.normal),
        ),
      ],
    );
    Widget content = Padding(
      padding: const EdgeInsets.fromLTRB(2, 15, 50, 28),
      child:
          Text('#原创 有钱人的生活就是这么朴实无华，且枯燥 #短视频,', style: StandardTextStyle.normal),
    );
    var buttonRow = Row(
      children: <Widget>[
        Text('2021-12-07', style: StandardTextStyle.smallWithOpacity),
        Expanded(child: Container()),
        _RowButton(
          iconData: Icons.share,
          title: '分享',
        ),
        _RowButton(
          iconData: Icons.mode_comment,
          size: SysSize.iconNormal - 2,
          title: '评论',
          onTap: onComment,
        ),
        _RowButton(
          iconData: Icons.favorite,
          title: '赞',
          onTap: onFavorite,
        ),
      ],
    );
    return Container(
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          userInfo,
          content,
          buttonRow,
        ],
      ),
    );
  }
}

class _RowButton extends StatelessWidget {
  final IconData? iconData;
  final Color? color;
  final double? size;
  final String? title;
  final Function? onTap;
  const _RowButton(
      {Key? key, this.iconData, this.size, this.color, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tapped(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: <Widget>[
            Icon(iconData ?? Icons.favorite,
                size: size ?? SysSize.iconNormal, color: color),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(title ?? '??', style: StandardTextStyle.small),
            ),
          ],
        ),
      ),
    );
  }
}
