import 'dart:convert';
import 'package:flutter_demo/utility/event_bus.dart';
import 'package:flutter_demo/global.dart';

const String EventUserLogin = "EventUserLogin";
const String EventUserLogout = "EventUserLogout";

class UserManager {
  static UserManager instance = UserManager();

  User? user;
  static User? get currentUser {
    return UserManager.instance.user;
  }

  logout() {
    this.user = null;
    preferences.remove('user');
    eventBus.emit(EventUserLogout);
  }

  login(Map<String, dynamic> userJson) {
    var user = User.fromJson(userJson);
    this.user = user;
    saveUser();
    eventBus.emit(EventUserLogin);
  }

  bool get isLogin {
    return user != null;
  }

  loadUserFromLocal() {
    String? userJson = preferences.getString('user');
    if (userJson != null) {
      user = User.fromJson(jsonDecode(userJson));
    }
  }

  void saveUser() async {
    var data = json.encode(user);
    await preferences.setString('user', data);
  }
}

class User {
  late final String token;
  late final int id;
  late final String nickname;
  late final String avartarurl;
  late final bool isVip;
  late final double wealth;
  late final int coupon;
  late final int ticket;

  User.fromJson(Map json) {
    token = json['token'];
    id = json['id'];
    nickname = json['nickname'];
    avartarurl = json['avatar'];
    isVip = json['is_vip'] == 1;
    wealth = json['wealth'];
    coupon = json['coupon'];
    ticket = json['ticket'];
  }
  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'nickname': nickname,
      'avartarurl': avartarurl,
      'isVip': isVip ? 1 : 0,
      'wealth': wealth,
      'coupon': coupon,
      'ticket': ticket
    };
  }
}
