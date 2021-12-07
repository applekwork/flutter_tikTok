import 'dart:html';

import 'package:flutter/material.dart';
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
      padding: EdgeInsets.only(bottom: 80 + MediaQuery.of(context).padding.bottom),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        bool isF = SafeMap(fMap)[index].boolean ?? false;
        return ;
      },
    ),
  }
}

class FollowRow extends StatelessWidget {
  final bool? isFavorite;
  final Function? onFavorite;
  final Function? onComment;
  final Function? onShare;
  final Function? onAddFavorite;
}