import 'package:flutter/material.dart';
import 'package:flutter_demo/utility/styles.dart';

class SendCodeButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final int codeDownSeconds;
  const SendCodeButton({Key? key, required this.codeDownSeconds, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (codeDownSeconds > 0) {
      return Container(
        width: 100,
        child: Center(
          child: Text(
            '${codeDownSeconds}s',
            style: TextStyle(fontSize: 14,color: ColorPlate.primary),),
        ),
      );
    }
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 100,
        child: Text('获取验证码',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: ColorPlate.primary)),
      ),
    );
  }
}
