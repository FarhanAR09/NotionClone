import 'package:notion_clone/models/user.dart';
import 'package:notion_clone/static/endpoints.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserAPI{
  Future createUser (User user) async {
    print("User: " + user.username + user.password);
    final response = await http.post(
      Uri.parse('http://localhost:3000/auth/signup'),
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
      Uri.parse('http://localhost:3000/auth/signin'),
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
      return user.username;
    }
  }
}