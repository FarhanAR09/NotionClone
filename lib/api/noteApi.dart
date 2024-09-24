import 'package:notion_clone/models/note.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notion_clone/static/loginInfo.dart';
import '../static/endpoints.dart';

class NoteAPI {
  Future<List<Note>> fetchNoteTitles (String username) async {
    // await Future.delayed(const Duration(seconds: 1));
    // return [Note("1", "Judul 1", "", "1")];
    final response = await http.get(
      Uri.parse("http://localhost:3000/notes/get/$username"),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (!(response.statusCode >= 200 && response.statusCode <= 299)){
      throw Exception(response.body);
    }
    else {
      print(response.body);
      final data = jsonDecode(response.body);
      return (data as List<dynamic>).map<Note>((obj){
        return Note(obj['_id'], obj['title'], '', obj['userID']);
      }).toList();
    }
  }

  Future<List<Note>> fetchNoteTitlesDummy () async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Note("1", "Judol1", "", "user1"),
      Note("2", "Judol2", "", "user2"),
      Note("3", "Judol3", "", "user3"),
      Note("4", "Judol4", "", "user4"),
    ];
  }

  Future<Note> fetchNoteDummy (String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Note("1", "Judol1", "aaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaa", "user1");
  }

  Future<Note> fetchNote (String id) async {
    // await Future.delayed(const Duration(seconds: 1));
    // return Note("1", "Judol1", "aaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaa", "user1");
    final response = await http.get(
      Uri.parse('http://localhost:3000/notes/gets/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (!(response.statusCode >= 200 && response.statusCode <= 299)){
      throw Exception(response.body);
    }
    else {
      final data = jsonDecode(response.body);
      return Note(data['_id'], data['title'], data['content'], data['userID']);
    }
  }

  Future createNote (Note note) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/notes/create'),
      body: {
        'title' : note.title,
        'content' : note.content,
        'userID' : LoginInfo.username,
      },
    );
    if (!(response.statusCode >= 200 && response.statusCode <= 299)){
      throw Exception(response.body);
    }
  }

  Future editNote (Note note) async {
    print(note.id);
    final response = await http.put(
      Uri.parse('http://localhost:3000/notes/update/${note.id}'),
      body: {
        'title' : note.title,
        'content' : note.content,
      },
    );
    if (!(response.statusCode >= 200 && response.statusCode <= 299)){
      throw Exception(response.body);
    }
  }

  Future deleteNote (String id) async {
    final response = await http.delete(
      Uri.parse('http://localhost:3000/notes/delete/$id'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (!(response.statusCode >= 200 && response.statusCode <= 299)){
      throw Exception(response.body);
    }
  }
}