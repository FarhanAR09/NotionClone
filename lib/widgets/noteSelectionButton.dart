import 'package:flutter/material.dart';
import 'package:notion_clone/screens/pageView.dart';

import 'package:notion_clone/models/note.dart';

class NoteSelectionButton extends StatelessWidget{

  const NoteSelectionButton({super.key, required this.title, required this.id});

  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const PageViewScreen(id: 'ini ID',)));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.grey,
        ),
        child: Text(title, style: const TextStyle(color: Colors.white),),
      ),
    );
  }

}