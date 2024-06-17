import 'package:flutter/material.dart';
import 'package:quizzler/maintext.dart';
void main() {
  runApp(const quizApp());
}

class quizApp extends StatefulWidget {
  const quizApp({super.key});

  @override
  State<quizApp> createState() => _quizAppState();
}

class _quizAppState extends State<quizApp> {
  
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quizzler",
      home:Content(),
    );
  }
}
