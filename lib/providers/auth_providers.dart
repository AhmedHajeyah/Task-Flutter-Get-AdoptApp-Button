import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/services/auth_services.dart';
import 'package:flutter/material.dart';

class AuthProviders extends ChangeNotifier {
  late User user;
  late String token;
  void signUp(User user) async {
    token = await AuthServices().signUp(user);
    this.user = user;
    notifyListeners();
  }
}
