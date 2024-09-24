import 'package:flutter/material.dart';
import 'package:notion_clone/api/noteApi.dart';

import 'package:notion_clone/models/note.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({super.key, required this.id}){
    data = NoteAPI().fetchNoteDummy(id);
  }

  late Future<Note> data;
  final String id;
  final TextEditingController judulController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Note"),),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: () { print("Refreshing"); },
              child: const Icon(Icons.refresh, color: Colors.black,),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () { print("Adding"); },
              child: const Icon(Icons.add, color: Colors.black,),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: const InputDecoration(hintText: "Judul"),
                  controller: judulController,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: "Konten"),
                  controller: contentController,
                ),
                GestureDetector(
                  onTap: (){
                    //NoteAPI().editNote();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Berhasil edit"))
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text("SAVE!"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}