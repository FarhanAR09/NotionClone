import 'package:notion_clone/models/note.dart';

class NoteAPI {
  Future<List<Note>> fetchNoteTitles () async {
    await Future.delayed(const Duration(seconds: 1));
    return [Note("1", "Judul 1", "", "1")];
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

  Future createNote (Note note) async {

  }

  Future editNote (Note note) async {

  }

  Future deleteNote (String id) async {

  }
}