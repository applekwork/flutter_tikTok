import 'package:flutter/material.dart';
import 'package:flutter_demo/style/style.dart';

class SelectText extends StatelessWidget {
  final bool isSelect;
  final String? title;
  const SelectText({Key? key, this.isSelect: true, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      color: ColorPlate.black.withOpacity(0),
      child: Text(
        title ?? "?",
        textAlign: TextAlign.center,
        style: isSelect ? StandartTextStyle.big : StandartTextStyle.bigWithOpacity,
      ),
    );
  }
}
