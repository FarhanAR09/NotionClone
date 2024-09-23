import 'package:notion_clone/models/note.dart';

class NoteAPI {
  static Future<List<Note>> fetchNoteTitles () async {
    return [Note("1", "1", "1")];
  }

  static Future<List<Note>> fetchNoteTitlesDummy () async {
    Future.delayed(const Duration(seconds: 1));
    return [
      Note("Judol1", "", "user1"),
      Note("Judol2", "", "user2"),
      Note("Judol3", "", "user3"),
      Note("Judol4", "", "user4"),
    ];
  }
}