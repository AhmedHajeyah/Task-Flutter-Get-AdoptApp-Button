import 'package:adopt_app/models/user.dart';
import 'package:dio/dio.dart';

class AuthServices {
  final _dio = Dio();

  Future<String> signUp(User user) async {
    Response res = await _dio.post(
        "https://coded-pets-api-auth.herokuapp.com/signup/",
        data: user.toJson());
    print(res.data["token"]);
    return res.data["token"];
  }
}
