import 'package:flutter/material.dart';
import 'package:flutter_demo/public.dart';

class NovelSummaryView extends StatelessWidget {
  final String summary;
  final bool isUnfold;
  final VoidCallback onPressed;

  const NovelSummaryView(
      {Key? key,
      required this.summary,
      required this.isUnfold,
      required this.onPressed})
      : super(key: key);

      @override
      Widget build(BuildContext context) {
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            color: ColorPlate.white,
            padding: EdgeInsets.all(15),
            child: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.bottomEnd,
              children: <Widget>[
            Text(
              summary,
              maxLines: isUnfold ? null : 3,
              style: TextStyle(fontSize: 14),
            ),
            Image.asset('assets/images/detail_fold_bg.png'),
            Image.asset(isUnfold ? 'assets/images/detail_up.png' : 'assets/images/detail_down.png'),
              ],
            ),
          ),
        );
      }
}
