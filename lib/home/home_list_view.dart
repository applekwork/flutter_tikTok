import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'home_model.dart';
import 'home_banner.dart';
import 'home_menu.dart';
import 'novel_normal_card.dart';
import 'novel_four_grid_view.dart';
import 'novel_first_hybird_card.dart';
import 'novel_second_hybird_card.dart';

enum HomeListType {
  excellent,
  male,
  female,
  cartoon,
}

class HomeListView extends StatefulWidget {
  final HomeListType type;

  HomeListView(this.type);

  @override
  State<StatefulWidget> createState() {
    return _HomeListViewState();
  }
}

class _HomeListViewState extends State<HomeListView> {
  List<CarouselInfo> carouselInfos = [];
  int pageIndex = 1;
  List<HomeModel> models = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> fetchData() async {
    try {
      late var action;
      switch (this.widget.type) {
        case HomeListType.excellent:
          action = 'home_excellent';
          break;
        case HomeListType.female:
          action = 'home_female';
          break;
        case HomeListType.male:
          action = 'home_male';
          break;
        case HomeListType.cartoon:
          action = 'home_cartoon';
          break;
        default:
          break;
      }
      var responseJson = await Requester.get(action: action);
      List moduleData = responseJson['module'];
      List<HomeModel> modules = [];
      moduleData.forEach((data) {
        modules.add(HomeModel.fromJson(data));
      });

      setState(() {
        this.models = modules;
        this.carouselInfos = carouselInfos;
      });
    } catch (e) {
      Toaster.show(e.toString());
    }
  }

  Widget bookCardWithInfo(HomeModel model) {
    Widget? card;
    switch (model.style) {
      case 1:
        card = NovelFourGridView(model);
        break;
      case 2:
        card = NovelSecondHybirdCard(model);
        break;
      case 3:
        card = NovelFirstHybridCard(model);
        break;
      case 4:
        card = NovelNormalCard(model);
        break;
    }
    return card ?? SizedBox();
  }

  Widget buildModule(BuildContext context, HomeModel module) {
    if (module.carousels != null) {
      return HomeBanner(module.carousels!);
    } else if (module.menus != null) {
      return HomeMenu(module.menus!);
    } else if (module.books != null) {
      return bookCardWithInfo(module);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
          itemCount: models.length,
          itemBuilder: (BuildContext context, int index) {
            return buildModule(context, models[index]);
          },
        ),
      ),
    );
  }
}
