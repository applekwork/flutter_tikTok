import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UserInteraction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("用户交互"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        body: GestureDetectorParentViewResponseView());
  }
}

class ListenerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
        child: Container(
          color: Colors.red,
          width: 300,
          height: 300,
        ),
        onPointerDown: (event) => print("down $event"), //手势按下回调
        onPointerMove: (event) => print("move $event"), //手势移动回调
        onPointerUp: (event) => print("up $event") //手势抬起回调
        );
  }
}

class GestureDetectorView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GestureDetectorViewState();
  }
}

class _GestureDetectorViewState extends State<GestureDetectorView> {
  double _top = 0.0;
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: Container(color: Colors.red, width: 100, height: 100),
              onTap: () => print("Tap 点击回调"),
              onDoubleTap: () => print("DoubleTap 双击回调"),
              onLongPress: () => print("LongPress 长按回调"),
              onPanUpdate: (e) {
                //拖动回调
                setState(() {
                  //更新位置
                  print("点击了");
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
            ))
      ],
    );
  }
}

class GestureDetectorChildViewResponseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print("父视图的点击回调"),
      child: Container(
        child: GestureDetector(
          onTap: () => print("子视图的点击回调"),
          child: Container(
            color: Colors.green,
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}

class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class GestureDetectorParentViewResponseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 return RawGestureDetector(
      gestures: {
        MultipleTapGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<MultipleTapGestureRecognizer>(
          () => MultipleTapGestureRecognizer(),
          (MultipleTapGestureRecognizer instance) {
            instance.onTap = () => print('parent tapped '); //点击回调
          },
        )
      },
      child: Container(
        width: 200,
        height:200,
        color: Colors.pinkAccent,
        child: GestureDetector(
          onTap:  () => print("子视图的点击回调"),
        ),
      ),
    );
  }
}
