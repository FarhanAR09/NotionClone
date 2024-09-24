import 'dart:convert';
import 'package:notion_clone/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:notion_clone/static/endpoints.dart';

class UserAPI{
  Future createUser (User user) async {
    final response = await http.post(
      Uri.parse(Endpoints.signUp),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username' : user.username,
        'password' : user.password,
      }),
    );
    if (!(response.statusCode >= 200 && response.statusCode <= 299)){
      throw Exception(response.body);
    }
  }

  Future<String> signIn (User user) async {
    final response = await http.post(
      Uri.parse(Endpoints.signIn),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username' : user.username,
        'password' : user.password,
      }),
    );
    if (!(response.statusCode >= 200 && response.statusCode <= 299)){
      throw Exception(response.body);
    }
    else {
      return jsonDecode(response.body)['username'];
    }
  }
}