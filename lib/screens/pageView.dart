import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  PageViewScreenState createState() => PageViewScreenState();
}

class PageViewScreenState extends State<PageViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes",),
      ),
    );
  }
}