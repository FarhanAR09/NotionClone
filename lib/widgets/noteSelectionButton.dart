import 'package:flutter/material.dart';
import 'package:notion_clone/screens/pageView.dart';

import 'package:notion_clone/models/note.dart';

import '../screens/editNoteScreen.dart';

class NoteSelectionButton extends StatelessWidget{

  const NoteSelectionButton({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditNoteScreen(id: id,)));
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
      ],
    );
  }

}