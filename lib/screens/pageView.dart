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
    data = NoteAPI().fetchNoteDummy(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note View",),
      ),
      body: FutureBuilder(
        future: data,
        builder: (BuildContext context, AsyncSnapshot<Note> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());  // Loading state
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));  // Error state
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No Data'));
          } else {
            return Center(child: Text("Judul: ${snapshot.data!.title}"));
          }
        },
      ),
    );
  }
}