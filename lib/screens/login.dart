import 'package:flutter/material.dart';
import 'package:notion_clone/api/userApi.dart';
import 'package:notion_clone/screens/noteSelection.dart';
import 'package:notion_clone/static/loginInfo.dart';

import '../models/user.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameLoginController = TextEditingController();
  final passwordLoginController = TextEditingController();

  final usernameRegisterController = TextEditingController();
  final passwordRegisterController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void showMessage(String message){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message))
      );
    }

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
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(
              width: 0.7 * MediaQuery.sizeOf(context).width,
              child: TextField(
                controller: usernameLoginController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: 'Username'
                ),
              ),
            ),
            SizedBox(
              width: 0.7 * MediaQuery.sizeOf(context).width,
              child: TextField(
                controller: passwordLoginController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: 'Password'
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                // UserAPI().signIn(User(usernameLoginController.text, passwordLoginController.text))
                // .then((username){
                //   LoginInfo.username = username;
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteSelectScreen()));
                // })
                // .catchError((err){
                //   print(err);
                //   showMessage("Gagal login");
                // });
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteSelectScreen()));
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const Text(
                  "LOGIN",
                ),
              ),
            ),
            const SizedBox(height: 32,),
            const Text(
                "REGISTER HERE",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )
            ),
            SizedBox(
              width: 0.7 * MediaQuery.sizeOf(context).width,
              child: TextField(
                controller: usernameRegisterController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: 'Username'
                ),
              ),
            ),
            SizedBox(
              width: 0.7 * MediaQuery.sizeOf(context).width,
              child: TextField(
                controller: passwordRegisterController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    hintText: 'Password'
                ),
              ),
            ),
            GestureDetector(
                onTap: (){
                  // UserAPI().createUser(User(usernameLoginController.text, passwordLoginController.text))
                  //     .then((_){
                  //   showMessage("Berhasil register");
                  // })
                  //     .catchError((err){
                  //   print(err);
                  //   showMessage("Gagal register");
                  // });
                  showMessage("Berhasil register");
                },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
                child: const Text(
                  "REGISTER",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}