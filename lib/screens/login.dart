import 'package:flutter/material.dart';
import 'package:notion_clone/screens/noteSelection.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "LOGIN HERE",
            ),
            SizedBox(
              width: 0.5 * MediaQuery.sizeOf(context).width,
              child: TextField(
                controller: usernameController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: 'Username'
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteSelectScreen()));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const Text(
                  "LOGIN"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}