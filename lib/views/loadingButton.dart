import 'package:flutter/material.dart';
import 'package:flutter_demo/style/style.dart';
import 'package:flutter_demo/style/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:tapped/tapped.dart';

class LoadingButton extends StatelessWidget {
  final String buttonText;
  final bool isLoading;
  final bool shadow;
  final bool primary;
  final Function? onTap;
  final EdgeInsets? margin;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;

  const LoadingButton(
      {Key? key,
      required this.buttonText,
      this.isLoading: false,
      this.shadow: false,
      this.primary: true,
      this.onTap,
      this.margin,
      this.height,
      this.backgroundColor,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var body = Container(
      height: height ?? 44,
      width: double.infinity,
      padding: margin ?? EdgeInsets.symmetric(horizontal: 60),
      color: ColorPlate.clear,
      child: Container(
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          shadows: shadow
              ? [BoxShadow(color: ColorPlate.black.withOpacity(0.1))]
              : [],
          color: backgroundColor ??
              (primary ? ColorPlate.orange : ColorPlate.white),
        ),
        child: IndexedStack(
          alignment: Alignment.center,
          index: isLoading ? 0 : 1,
          children: <Widget>[
            CupertinoActivityIndicator(),
            Container(
              child: AdMusicsText.normal(
                buttonText,
                enableOffset: true,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textColor ??
                      (primary ? ColorPlate.white : ColorPlate.orange),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return Container(
      child: Tapped(
        child: body,
        onTap: () {
          if (!isLoading) {
            onTap?.call();
          }
        },
      ),
    );
  }
}
