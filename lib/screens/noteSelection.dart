import 'package:flutter/material.dart';
import 'package:notion_clone/api/noteApi.dart';

import 'package:notion_clone/models/note.dart';
import 'package:notion_clone/static/loginInfo.dart';
import 'package:notion_clone/widgets/noteSelectionButton.dart';

import 'editNoteScreen.dart';

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
    refresh();
  }

  void refresh(){
    data = NoteAPI().fetchNoteTitles(LoginInfo.username);
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
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          refresh();
                        });
                      },
                      child: const Icon(Icons.refresh, color: Colors.black,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteScreen(id: '_', editMode: false,)));
                      },
                      child: const Icon(Icons.add, color: Colors.black,),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: snapshot.data!.map<Widget>((note) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: NoteSelectionButton(title: note.title, id: note.id),
                      )).toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}