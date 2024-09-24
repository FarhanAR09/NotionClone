import 'package:flutter/material.dart';
import 'package:notion_clone/api/noteApi.dart';
import 'package:notion_clone/screens/pageView.dart';

import '../screens/editNoteScreen.dart';

class NoteSelectionButton extends StatelessWidget{

  const NoteSelectionButton({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {

    void showMessage(String message){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message))
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewScreen(id: id,)));
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.grey,
            ),
            child: Text(title, style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(width: 4,),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteScreen(id: id, editMode: true,)));
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.grey,
            ),
            child: const Text('EDIT', style: TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(width: 4,),
        GestureDetector(
          onTap: (){
            NoteAPI().deleteNote(id)
                .then((res){
                  showMessage("Berhasil hapus");
            })
                .catchError((err){
                  showMessage("Gagal hapus");
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.grey,
            ),
            child: const Text('HAPUS', style: TextStyle(color: Colors.white),),
          ),
        ),
      ],
    );
  }

}