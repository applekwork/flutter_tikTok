import 'package:flutter/material.dart';
import 'package:flutter_demo/style/style.dart';
import 'package:flutter_demo/views/topToolRow.dart';
import 'package:flutter_demo/controller/userPageDetail.dart';
import 'package:tapped/tapped.dart';

class UserPage extends StatefulWidget {
  final bool canPop;
  final bool isSelfPage;
  final Function? onPop;
  final Function? onSwitch;

  const UserPage({
    Key? key,
    this.canPop: false,
    this.onPop,
    this.onSwitch,
    required this.isSelfPage,
  }) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    //关注
    Widget likeButton = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Tapped(
            child: _UserRightButton(title: widget.isSelfPage ? '关注' : '钱包'),
          ),
        ],
      ),
    );
    //avart
    Widget avatar = Container(
      height: 100 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(left: 15),
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 70,
        width: 70,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 2),
          borderRadius: BorderRadius.circular(35),
        ),
        child: ClipOval(
          child: Image.network(
              'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif',
              fit: BoxFit.cover),
        ),
      ),
    );
    Widget body = ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: <Widget>[
        Container(height: 50),
        //头像 关注
        Stack(
          alignment: Alignment.bottomLeft,
          children: <Widget>[likeButton, avatar],
        ),
        //用户信息
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('用户名', style: StandardTextStyle.big),
                    Container(height: 10),
                    Text('朴实无华，且枯燥',
                        style: StandardTextStyle.smallWithOpacity
                            .apply(color: Colors.white)),
                    Container(height: 10),
                    Row(
                      children: <Widget>[
                        _UserTag(tag: '幽默'),
                        _UserTag(tag: '机智'),
                        _UserTag(tag: '枯燥'),
                        _UserTag(tag: '狮子座'),
                      ],
                    ),
                    Container(height: 30),
                    //关注 粉丝 获赞
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextGroup('356', '关注'),
                          TextGroup('145万', '粉丝'),
                          TextGroup('1423万', '获赞'),
                        ],
                      ),
                    ),
                    //视频内容部分分割线
                    Container(
                      height: 10,
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Colors.white.withOpacity(.1)),
                      )),
                    ),
                  ],
                ),
              ),
              //视频列表
              _UserVideoTable(),
            ],
          ),
        ),
      ],
    );
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          body,
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 90,
            child: TopToolRow(
              canPop: widget.canPop,
              onPop: widget.onPop,
              right: Tapped(
                child: Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.more_horiz,
                    size: 24,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => UserDetailPage()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _UserRightButton extends StatelessWidget {
  final String? title;

  const _UserRightButton({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.all(6),
      child: Text(title!, style: TextStyle(color: ColorPlate.orange)),
      decoration: BoxDecoration(
        border: Border.all(color: ColorPlate.orange),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class _UserTag extends StatelessWidget {
  final String? tag;
  const _UserTag({Key? key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(tag ?? '标签', style: StandardTextStyle.normal),
    );
  }
}

class _SmallVideo extends StatelessWidget {
  const _SmallVideo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: AspectRatio(
      aspectRatio: 3 / 4.0,
      child: Container(
        decoration: BoxDecoration(
          color: ColorPlate.darkGray,
          border: Border.all(color: Colors.black),
        ),
        alignment: Alignment.center,
        child: Text("作品",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900)),
      ),
    ));
  }
}

class _PointSelectTextButton extends StatelessWidget {
  final bool isSelect;
  final String title;
  final Function? onTap;
  const _PointSelectTextButton(this.isSelect, this.title,
      {Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        isSelect
            ? Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: ColorPlate.orange,
                  borderRadius: BorderRadius.circular(3),
                ),
              )
            : Container(),
        Container(
          padding: EdgeInsets.only(left: 5),
          child: Text(title,
              style: isSelect
                  ? StandardTextStyle.small
                  : StandardTextStyle.smallWithOpacity),
        ),
      ],
    ));
  }
}

class TextGroup extends StatelessWidget {
  final String title, tag;
  final Color? color;

  const TextGroup(this.title, this.tag, {Key? key, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            style: StandardTextStyle.big.apply(color: Colors.white),
          ),
          Container(width: 4),
          Text(
            tag,
            style: StandardTextStyle.smallWithOpacity.apply(
              color: color?.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserVideoTable extends StatelessWidget {
  const _UserVideoTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _PointSelectTextButton(true, '作品'),
              _PointSelectTextButton(false, '关注'),
              _PointSelectTextButton(false, '喜欢')
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              _SmallVideo(),
              _SmallVideo(),
              _SmallVideo(),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              _SmallVideo(),
              _SmallVideo(),
              _SmallVideo(),
            ],
          ),
        ),
      ],
    );
  }
}
