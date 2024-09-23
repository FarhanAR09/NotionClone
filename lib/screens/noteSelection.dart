import 'package:flutter/material.dart';

import 'package:notion_clone/models/note.dart';

class NoteSelectScreen extends StatefulWidget {

  NoteSelectScreen({super.key});

  List<Note> notes = [
    Note("what1", "", "1user"),
    Note("what2", "", "2user"),
  ];

  @override
  NoteSelectScreenState createState() => NoteSelectScreenState();
}

class NoteSelectScreenState extends State<NoteSelectScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Notes",),
      ),
    );
  }
}