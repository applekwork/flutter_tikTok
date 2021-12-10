import 'package:flutter/material.dart';
import 'package:flutter_demo/style/style.dart';
import 'package:tapped/tapped.dart';

enum ItemButton {
  ItemButtonFen,
  ItemButtonZan,
  ItemButtonContact,
  ItemButtonComment
}

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    Widget topView = Container(
        height: 90,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _ItemViewButton(
                topIcon: Icons.person,
                title: '粉丝',
                itemType: ItemButton.ItemButtonFen),
            _ItemViewButton(
                topIcon: Icons.golf_course,
                title: '赞',
                itemType: ItemButton.ItemButtonFen),
            _ItemViewButton(
                topIcon: Icons.people,
                title: '@',
                itemType: ItemButton.ItemButtonFen),
            _ItemViewButton(
                topIcon: Icons.mode_comment,
                title: '评论',
                itemType: ItemButton.ItemButtonFen),
          ],
        ));
    Widget body = ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: <Widget>[
        topView,
        _MessageRow(
          title: '商务洽谈',
          content: '您收到了3个洽谈申请',
          time: '2021-12-08',
         ),
           _MessageRow(
          title: '商务洽谈',
          content: '您收到了3个洽谈申请',
          time: '2021-12-08',
        ),
          _MessageRow(
          title: '商务洽谈',
          content: '您收到了3个洽谈申请',
          time: '2021-12-08',
        ),
      ],
    );
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[Expanded(child: body)],
        ),
      ),
    );
  }
}

class _ItemViewButton extends StatelessWidget {
  final IconData? topIcon;
  final String? title;
  final ItemButton? itemType;
  final Function(ItemButton)? onTap;

  const _ItemViewButton(
      {Key? key, this.topIcon, this.title, this.onTap, this.itemType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget item = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            topIcon!= null ?
             Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.red,Colors.amber],
                      stops: [0.1, 0.8]
                    ),
                  ),
                  child: Icon(
                    topIcon ?? Icons.error,size: 40,
                  ),
                )
            : Container(),
            Text(title ?? '', style: StandardTextStyle.normal)
          ],
        ),
      ),
    );
    item = Tapped(child: item, onTap: onTap);
    return item;
  }
}

class _MessageRow extends StatelessWidget {
  final Widget? leftIcon;
  final String? title;
  final String? content;
  final String? time;

  const _MessageRow(
      {Key? key, this.leftIcon, this.title, this.content, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget leftView = Container(
      padding: EdgeInsets.all(5),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(25)),
        child: ClipOval(
          child: Image.network(
              "https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif",fit: BoxFit.cover,),
        ),
      ),
    );
    Widget middleView = Container(
      padding: EdgeInsets.only(left: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title ?? '标题', style: StandardTextStyle.big),
            Container(height: 10),
            Text(content ?? '内容', style: StandardTextStyle.smallWithOpacity),
          ],
        ),
      ),
    );
    Widget rightView = Container(
      child: Text(time ?? '时间', style: StandardTextStyle.smallWithOpacity),
    );
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Container(
          child: Column(
            children: <Widget>[
               Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    leftView,
                    Expanded(child: middleView),
                    rightView
                  ],
                ),
                Expanded(child: Container()),
                Container(
                  color: Colors.white,
                  height: 1,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0))
            ],
          ),
        )
      ),
    );
  }
}
