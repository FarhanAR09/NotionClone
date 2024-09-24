import 'package:notion_clone/models/user.dart';

class UserAPI{
  Future createUser (User user) async {

  }

  Future<String> login (User user) async {
    return user.username;
  }
}