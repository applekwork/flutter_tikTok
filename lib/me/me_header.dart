import 'package:flutter/material.dart';
import 'package:flutter_demo/app/userManager.dart';
import 'package:flutter_demo/public.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MeHeader extends StatelessWidget {
  final VoidCallback? onPressed;

  const MeHeader({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = UserManager.currentUser;
    Widget buildItem(String title, String subtitle) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
          )
        ],
      );
    }

    Widget buildItems() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildItem(
              user != null ? user.wealth.toStringAsFixed(1) : '0.0', '书豆金额'),
          buildItem(user != null ? user.coupon.toString() : '0', '书券（张）'),
          buildItem(user != null ? user.ticket.toString() : '0', '月票')
        ],
      );
    }

    return GestureDetector(
      onTap:onPressed,
      child: Container(
        color: ColorPlate.white,
        padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
        child: Row(
          children: <Widget>[
            CircleAvatar(
                radius: 40,
                backgroundImage: (user?.avartarurl != null
                    ? CachedNetworkImageProvider(user!.avartarurl)
                    : AssetImage('assets/images/placeholder_avatar.png')
                        as ImageProvider<Object>?)),
            SizedBox(
              width: 25,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user?.nickname != null ? user!.nickname.toString() : '登录',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                buildItems(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
