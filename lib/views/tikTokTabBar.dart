import 'package:flutter/material.dart';
import 'package:flutter_demo/style/style.dart';
import 'package:flutter_demo/views/selectText.dart';

enum TikTokPageTag {
  home,
  follow,
  msg,
  me,
}

class TikTokTabBar extends StatelessWidget {
  final Function(TikTokPageTag)? onTabSwitch;

  final bool hasBackground;
  final TikTokPageTag? current;

  const TikTokTabBar(
      {Key? key,
      this.onTabSwitch,
      this.current,
      this.hasBackground: false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    Widget row = Row(
      children: <Widget>[
        Expanded(
            child: GestureDetector(
          child: SelectText(
            isSelect: current == TikTokPageTag.home,
            title: '首页',
          ),
          onTap: () => onTabSwitch?.call(TikTokPageTag.home),
        )),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == TikTokPageTag.follow,
              title: '关注',
            ),
            onTap: () => onTabSwitch?.call(TikTokPageTag.follow),
          ),
        ),
        Expanded(
            child: GestureDetector(
                child: SelectText(
                  isSelect: current == TikTokPageTag.msg,
                  title: '消息',
                ),
                onTap: () => onTabSwitch?.call(
                      TikTokPageTag.msg,
                    ))),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == TikTokPageTag.me,
              title: '我的',
            ),
            onTap: () => onTabSwitch?.call(TikTokPageTag.me),
          ),
        ),
      ],
    );
    return Container(
      color: hasBackground ? ColorPlate.back2 : ColorPlate.back2.withOpacity(0),
      child: Container(
        padding: EdgeInsets.only(bottom: padding.bottom),
        height: 50 + padding.bottom,
        child: row,
    ));
  }
}
