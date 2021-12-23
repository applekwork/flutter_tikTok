import 'package:flutter/material.dart';
import 'package:flutter_demo/bookshelf/bookshelf_item_view.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/utility/constant.dart';
import 'package:flutter/services.dart';

class BookshelfScene extends StatefulWidget with RouteAware {
  @override
  _BookshelfSceneState createState() => _BookshelfSceneState();
}

class _BookshelfSceneState extends State<BookshelfScene> {
  List<Novel> favoriteNovels = [];
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  Future<void> fetchData() async {
    try {
      List<Novel> favoriteNovels = [];
      List<dynamic> favoriteResponse = await Requester.get(action: 'bookshelf');
      favoriteResponse.forEach((data) {
        favoriteNovels.add(Novel.fromJson(data));
      });
      setState(() {
        this.favoriteNovels = favoriteNovels;
      });
    } catch (e) {
      Toaster.show(e.toString());
    }
  }

  Widget buildFavoriteView() {
    if (favoriteNovels.length == 0) return Container();
    List<Widget> children = [];
    var novels = favoriteNovels;
    novels.forEach((element) {
      children.add(BookshelfItemView(novel: element));
    });
    var width = (Screen.width - 15 * 2 - 24 * 2) / 3;
    children.add(GestureDetector(
      onTap: () {
        eventBus.emit(EventToggleTabBarIndex, 1);
      },
      child: Container(
        color: ColorPlate.paper,
        width: width,
        height: width / 0.75,
        child: Image.asset('assets/images/bookshelf_add.png'),
      ),
    ));
    return Container(
      padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: Wrap(
        spacing: 23,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('书架'),),
      backgroundColor: ColorPlate.white,
      body: AnnotatedRegion(
        value: navAlpha > 0.5
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: Stack(children: [
          RefreshIndicator(
            onRefresh: fetchData,
            child: ListView(
              padding: EdgeInsets.only(top: 0),
              controller: scrollController,
              children: <Widget>[
                buildFavoriteView(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
