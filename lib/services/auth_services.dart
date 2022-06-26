import 'package:adopt_app/models/user.dart';
import 'package:adopt_app/services/client.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

class AuthServices {
  // final _dio = Dio();

  Future<String> signUp(User user) async {
    Response res = await ClientAuh.dio.post("/signup/", data: user.toJson());
    print(res.data["token"]);
    return res.data["token"];
  }

  Future<String> signIn(User user) async {
    Response res = await ClientAuh.dio.post("/signin/", data: user.toJson());
    print(res.data["token"]);
    return res.data["token"];
  }
}
