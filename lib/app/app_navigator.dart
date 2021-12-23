import 'package:flutter/material.dart';
import 'package:flutter_demo/me/login_scene.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/novel_detail/novel_detail_scene.dart';

class AppNavigator {

  static push(BuildContext ctx, Widget scene) {
    Navigator.push(
        ctx, MaterialPageRoute(builder: (BuildContext ctx) => scene));
  }

  static pushNovelDetail(BuildContext context, Novel novel) {
    AppNavigator.push(context, NovelDetailScene(novelId: novel.id));
  }
  static pushLogin(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScene();
    }));
  }
}
