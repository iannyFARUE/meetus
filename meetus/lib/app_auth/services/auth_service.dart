import 'package:http/http.dart' as http;
import 'package:schoolbookapp/models/app_user.dart';
import 'dart:convert';

class AuthService {
  static const url = "http://localhost:8080/skoolbook/api/register";

  Future<http.Response> signUpUser(AppUser user) {
    print(user.toJson());
    return http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
  }
}
