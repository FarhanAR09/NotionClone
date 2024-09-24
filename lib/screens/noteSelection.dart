import 'package:flutter/material.dart';
import 'package:notion_clone/api/noteApi.dart';

import 'package:notion_clone/models/note.dart';
import 'package:notion_clone/widgets/noteSelectionButton.dart';

class NoteSelectScreen extends StatefulWidget {

  const NoteSelectScreen({super.key});

  @override
  NoteSelectScreenState createState() => NoteSelectScreenState();
}

class NoteSelectScreenState extends State<NoteSelectScreen> {

  late Future<List<Note>> data;

  @override
  void initState() {
    super.initState();
    data = NoteAPI().fetchNoteTitles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Notes",),
      ),
      body: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());  // Loading state
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));  // Error state
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Data'));
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: snapshot.data!.map<Widget>((note) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NoteSelectionButton(title: note.title, id: note.id),
                )).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}