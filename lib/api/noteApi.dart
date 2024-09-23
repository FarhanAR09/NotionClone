import 'package:notion_clone/models/note.dart';

class NoteAPI {
  Future<List<Note>> fetchNoteTitles () async {
    return [Note("1", "1", "1", "1")];
  }

  Future<List<Note>> fetchNoteTitlesDummy () async {
    Future.delayed(const Duration(seconds: 1));
    return [
      Note("1", "Judol1", "", "user1"),
      Note("2", "Judol2", "", "user2"),
      Note("3", "Judol3", "", "user3"),
      Note("4", "Judol4", "", "user4"),
    ];
  }

  Future<Note> fetchNoteDummy (String id) async {
    Future.delayed(const Duration(seconds: 1));
    return Note("1", "Judol1", "", "user1");
  }
}