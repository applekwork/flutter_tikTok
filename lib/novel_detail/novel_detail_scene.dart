import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/novel_detail/novel_comment_cell.dart';
import 'package:flutter_demo/novel_detail/novel_detail_header.dart';
import 'package:flutter_demo/novel_detail/novel_detail_recommend.dart';
import 'package:flutter_demo/novel_detail/novel_detail_cell.dart';
import 'package:flutter_demo/novel_detail/novel_summary_view.dart';
import 'package:flutter_demo/novel_detail/novel_detail_toolbar.dart';
import 'package:flutter_demo/public.dart';

class NovelDetailScene extends StatefulWidget {
  final String novelId;
  const NovelDetailScene({Key? key, required this.novelId}) : super(key: key);
  @override
  _NovelDetailSceneState createState() => _NovelDetailSceneState();
}

class _NovelDetailSceneState extends State<NovelDetailScene> with RouteAware {
  Novel? novel;
  List<Novel> recommendNovels = [];
  List<NovelComment> comments = [];
  ScrollController scrollController = ScrollController();
  double navAlpha = 0;
  bool isSummaryUnfold = false;
  int commentCount = 0;
  int commentMemberCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }
  changeSummaryMaxLines() {
    setState(() {
      isSummaryUnfold = !isSummaryUnfold;
    });
  }
  fetchData() async {
    // try {
    var novelId = this.widget.novelId;
    var novelResponse =
        await Requester.post(action: 'novel_detail', params: {'id': novelId});
    var commentsResponse =
        await Requester.post(action: 'novel_comment', params: {'id': novelId});
    List<NovelComment> comments = [];
    commentsResponse.forEach((data) {
      comments.add(NovelComment.fromJson(data));
    });
    var recommendResponse = await Requester.post(
        action: 'novel_recommend', params: {'id': novelId});
    List<Novel> recommendNovels = [];
    recommendResponse.forEach((data) {
      recommendNovels.add(Novel.fromJson(data));
    });
    setState(() {
      this.novel = Novel.fromJson(novelResponse);
      this.comments = comments;
      this.recommendNovels = recommendNovels;
    });
    // } catch (e) {
    //   Toaster.show(e.toString());
    // }
  }

  Widget buildTags() {
    var colors = [Color(0xFFF9A19F), Color(0xFF59DDB9), Color(0xFF7EB3E7)];
    var i = 0;
    var tagWidgets = novel!.tags.map((tag) {
      var color = colors[i % 3];
      var tagWidget = Container(
        decoration: BoxDecoration(
          border: Border.all(
              // color: Color.fromARGB(99, color.red, color.green, color.blue),
              color: color,
              width: 1),
          borderRadius: BorderRadius.circular(3),
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Text(tag,
            style: TextStyle(
                fontSize: 14, color: color, fontWeight: FontWeight.bold)),
      );
      i++;
      return tagWidget;
    }).toList();
    var list = <Widget>[];
    list.addAll(tagWidgets);
    list.addAll(tagWidgets);
    list.addAll(tagWidgets);
    list.addAll(tagWidgets);
    list.addAll(tagWidgets);
    return Container(
      padding: EdgeInsets.all(15),
      color: ColorPlate.white,
      child: Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.spaceEvenly,
          runSpacing: 10,
          spacing: 10,
          children: list),
    );
  }

  Widget buildCommnet() {
    return Container(
      color: ColorPlate.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/home_tip.png'),
                SizedBox(width: 13),
                Text('书友评价', style: TextStyle(fontSize: 16)),
                Expanded(child: Container()),
                Image.asset('assets/images/detail_write_comment.png'),
                SizedBox(width: 10),
                Text('写书评',
                    style: TextStyle(fontSize: 14, color: ColorPlate.primary)),
                SizedBox(width: 15),
              ],
            ),
          ),
          Divider(height: 1),
          Column(
            children: comments
                .map((comment) => NovelCommentCell(comment: comment))
                .toList(),
          ),
          Divider(height: 1),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                '查看全部评论(${novel!.commentCount}条)',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.novel == null) {
      return Scaffold(appBar: AppBar(elevation: 0));
    }
    var novel = this.novel!;
    return Scaffold(
      appBar: AppBar(
        title: Text(novel.name),
      ),
      body: AnnotatedRegion(
        value: navAlpha > 0.5
            ? SystemUiOverlayStyle.dark
            : SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      padding: EdgeInsets.only(top: 10),
                      children: <Widget>[
                        NovelDetailHeader(novel: novel),
                        NovelSummaryView(
                            summary: novel.introduction,
                            isUnfold: isSummaryUnfold,
                            onPressed: changeSummaryMaxLines),
                        NovelDetailCell(
                          iconName: 'assets/images/detail_latest.png',
                          title: '最新',
                          subTitle: novel.lastChapter.title,
                          attachedWidget: Text(novel.status,
                              style: TextStyle(
                                  fontSize: 14, color: novel.statusColor())),
                        ),
                        NovelDetailCell(
                            iconName: 'assets/images/detail_chapter.png',
                            title: '目录',
                            subTitle: '共${novel.chapterCount}章'),
                        buildTags(),
                        Divider(height: 15),
                        buildCommnet(),
                        SizedBox(height: 10),
                        NovelDetailRecommend(novels: recommendNovels),
                      ],
                    ),
                  ),
                  NovelDetailToolbar(novel: novel),
                ],
              )
            ],
          )),
    );
  }
}
