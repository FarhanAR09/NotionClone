import 'dart:async';

import 'package:flutter/material.dart';
import 'package:notion_clone/api/noteApi.dart';

import 'package:notion_clone/models/note.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({super.key, required this.id, required this.editMode}){
    data = NoteAPI().fetchNoteDummy(id);
  }

  late final Future<Note> data;
  final bool editMode;
  final String id;
  final TextEditingController judulController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void showMessage(String message){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message))
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Note"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 0.8 * MediaQuery.of(context).size.width,
              child: TextField(
                decoration: const InputDecoration(hintText: "Judul"),
                controller: judulController,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 0.8 * MediaQuery.of(context).size.width,
              child: TextField(
                decoration: const InputDecoration(hintText: "Konten"),
                controller: contentController,
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: (){
                //NoteAPI().editNote();
                if (editMode) {
                  NoteAPI().editNote(Note(id, judulController.text, contentController.text, ""))
                      .then((res){
                        showMessage("Berhasil edit");
                  })
                      .catchError((err){
                        showMessage("Gagal edit");
                  });
                }
                else{
                  NoteAPI().createNote(Note("", judulController.text, contentController.text, ""))
                      .then((res){
                        showMessage("Berhasil buat");
                  })
                      .catchError((err){
                        showMessage("Gagal buat");
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(editMode ? "SAVE" : "CREATE"),
              ),
            ),
          ],
        ),
      ),
    );
  }

}