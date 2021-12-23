import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
        animationBehavior: AnimationBehavior.preserve);
    // final CurvedAnimation curve =
    //     CurvedAnimation(parent: controller, curve: Curves.easeInToLinear);
    animation = Tween(begin: 50.0, end: 200.0).animate(controller);
    // animation.addListener(() {
    //   setState(() {});
    // });
    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });
    controller.forward();
    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose(); // 释放资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation")),
      // body: Center(
      //     child: Container(
      //         width: animation.value, // 将动画的值赋给widget的宽高
      //         height: animation.value,
      //         child: FlutterLogo())
      //         ),
      // body: AnimatedLogo(animation: animation),
      body: Center(child: AnimatedBuilder(
        animation: animation,
        child:FlutterLogo(),
        builder:(context,child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child:child,
          );
        }
      )),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable as Animation;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
