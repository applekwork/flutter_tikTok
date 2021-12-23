import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';
import 'package:flutter_demo/home/home_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBanner extends StatelessWidget {
  final List<CarouselInfo> carouselInfos;

  const HomeBanner(this.carouselInfos);

  @override
  Widget build(BuildContext context) {
    if (carouselInfos.length == 0) {
      return SizedBox();
    }
    return Container(
      color: ColorPlate.white,
      child: CarouselSlider(
        items: carouselInfos.map((info) {
          return Container(
            width: Screen.width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Image.network(info.imageUrl ?? '',fit: BoxFit.cover),
          );
        }).toList(),
        options: CarouselOptions(
          aspectRatio: 2,
          autoPlay: true
        ),
      ),
    );
  }
}
