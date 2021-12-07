import 'package:flutter_demo/style/style.dart';
import 'package:flutter/material.dart';

class AdMusicsText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final TextStyle? defaultStyle;
  final bool? enableOffset;

  const AdMusicsText(
      {Key? key,
      this.text,
      this.style,
      this.defaultStyle,
      this.enableOffset: false})
      : super(key: key);

  const AdMusicsText.small(String text,
      {Key? key, TextStyle? style, bool? enableOffset})
      : this(
            key: key,
            text: text,
            style: style,
            defaultStyle: StandartTextStyle.small,
            enableOffset: enableOffset);

  const AdMusicsText.normal(String text,
      {Key? key, TextStyle? style, bool? enableOffset})
      : this(
            key: key,
            text: text,
            style: style,
            defaultStyle: StandartTextStyle.normal,
            enableOffset: enableOffset);
  const AdMusicsText.big(
    String text, {
    Key? key,
    TextStyle? style,
    bool? enableOffset,
  }) : this(
            key: key,
            text: text,
            style: style,
            defaultStyle: StandartTextStyle.big,
            enableOffset: enableOffset);

  bool get isAsci {
    for (var unit in text!.codeUnits) {
      if (unit > 0xff) {
        return false;
      }
    }
    return true;
  }

  double get offset {
    if (!isAsci) {
      return 0;
    }
    if (enableOffset != true) {
      return 0;
    }
    if (defaultStyle != null) {
      return (defaultStyle?.fontSize ?? 0) * 2 / 10;
    }
    if (style != null) {
      return (style?.fontSize ?? 0) * 2 / 10;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: offset),
      child: DefaultTextStyle(
        style: defaultStyle!,
        child: Text(
          text!,
          maxLines: 5,
          style: style,
        )
      ),
    );
  }
}
