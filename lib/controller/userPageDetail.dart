import 'package:flutter/material.dart';
import 'package:flutter_demo/utility/styles.dart';
import 'package:tapped/tapped.dart';

class UserDetailPage extends StatefulWidget {
  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    // Widget head = TikTokAppbar(title: '用户');
    var userHead = Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('个人信息'),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            '修改',
            style: StandardTextStyle.normal.apply(color: Colors.orange),
          ),
        ),
      ],
    );
    Widget body = ListView(
      padding: EdgeInsets.only(bottom: 80 + MediaQuery.of(context).padding.bottom),
      children: <Widget>[
        userHead,
        _UserInfoRow(title: '昵称',rightIcon: Text(
            '你XX穷哈哈的枯燥生活',
            style: StandardTextStyle.small)),
             _UserInfoRow(
          title: '头像',
          rightIcon: Text(
            '上传',
            style: StandardTextStyle.small,
          ),
        ),
        _UserInfoRow(
          title: '手机绑定',
          rightIcon: Text(
            '186****7767',
            style: StandardTextStyle.small,
          ),
        ),
        _UserInfoRow(
          title: '地址',
          rightIcon: Text(
            '龙子湖博雅广场信息产业大厦',
            style: StandardTextStyle.small,
          ),
        ),
        _UserInfoRow(
          title: '年龄',
          rightIcon: Text(
            '18',
            style: StandardTextStyle.small,
          ),
        ),
        _UserInfoRow(
          title: '用户性别',
          rightIcon: Text(
            '男',
            style: StandardTextStyle.small,
          ),
        ),
        _UserInfoRow(
          title: '职业',
          rightIcon: Text(
            '总裁',
            style: StandardTextStyle.small,
          ),
        ),
      ],
    );
      body = Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: body,
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text('用户')),
      body: Container(
        color: ColorPlate.back1,
        // height: double.infinity,
        // width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(child: body)
          ],
        ),
      ),
    );
  }
}

class _UserInfoRow extends StatelessWidget {
  final Widget? icon;
  final Widget? rightIcon;
  final String? title;
  final Function? onTap;
  const _UserInfoRow(
      {Key? key, this.icon, this.rightIcon, this.title, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget iconImg = Container(
      height: 24,
      width: 24,
      child: icon,
    );
    Widget row = Container(
      height: 48,
      // color: Colors.orangeAccent,
      // margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
      // decoration: BoxDecoration(
      //   color: Colors.black.withOpacity(0.22),
      //   border: Border(bottom: BorderSide(color: Colors.white12)),
      // ),
      child: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Row(
            children: <Widget>[
              icon != null ? iconImg : Container(),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(title!, style: TextStyle(fontSize: 14)),
              )),
              Opacity(
                opacity: 0.6,
                child: rightIcon ?? Icon(Icons.arrow_forward_ios, size: 12),
              ),
            ],
          ),
          Expanded(child: Container()),
          Container(
            height: 0.1,
            color: Colors.white,
          )
          // Divider(
          //   height: 0.5,
          //   color: Colors.red,
          // )
        ],
      ),
    );
    row = Tapped(
      child: row,
      onTap: onTap,
    );
    return row;
  }
  }