import 'package:flutter/material.dart';
import 'package:notion_clone/api/noteApi.dart';
import 'package:notion_clone/models/note.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key, required this.id});

  final String id;

  @override
  PageViewScreenState createState() => PageViewScreenState();
}

class PageViewScreenState extends State<PageViewScreen> {

  late Future<Note> data;

  @override
  void initState() {
    super.initState();
    data = NoteAPI().fetchNoteDummy('abc');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes",),
      ),
    );
  }
}