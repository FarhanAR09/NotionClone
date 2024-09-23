import 'package:flutter/material.dart';

import 'package:notion_clone/models/note.dart';
import 'package:notion_clone/widgets/noteSelectionButton.dart';

class NoteSelectScreen extends StatefulWidget {

  const NoteSelectScreen({super.key});

  @override
  NoteSelectScreenState createState() => NoteSelectScreenState();
}

class NoteSelectScreenState extends State<NoteSelectScreen> {

  List<Note> notes = [
    Note("abc1", "what1", "", "1user"),
    Note("abc2", "what2", "", "2user"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Notes",),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: notes.map((note) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: NoteSelectionButton(title: note.title, id: note.id),
          )).toList(),
        ),
      ),
    );
  }
}