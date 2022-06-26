import 'dart:convert';

import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthProviders extends ChangeNotifier {
  late User user;
  late String token = "";
  void signUp(User user) async {
    token = await AuthServices().signUp(user);
    this.user = user;
    notifyListeners();
  }

  void signIn(User user) async {
    token = await AuthServices().signIn(user);
    this.user = user;
    notifyListeners();
  }

  bool get isAuth {
    if (token.isNotEmpty && Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
      user = User.fromJson2(Jwt.parseJwt(token));

      print(user);
      return false;
    } else {
      return true;
    }
  }
}
