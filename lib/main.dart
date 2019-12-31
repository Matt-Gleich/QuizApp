import "package:flutter/material.dart";


import './coreWidgets/quiz.dart';
import './coreWidgets/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // State for MyApp class
  var _questionIndex = 0;
  static const _questions = [
    {
      "question": "What is your favorite color?",
      "answers": ["🔴 Red 🔴", "🟢 Green 🟢", "🔵 Blue 🔵"]
    },
    {
      "question": "What is your favorite animal?",
      "answers": ["🐶 Dog 🐶", "😺 Cat 😺", "🦝 Racoon 🦝"]
    }
  ];

  void _answeredQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    }); // Change state of MyApp Widget
  }

  void _restart() {
    setState(() {
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("✏️    Quiz App    ✏️"),
          backgroundColor: Colors.black,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answeredQuestion: _answeredQuestion,
                questionIndex: _questionIndex,
                restart: _restart,
              )
            : Result(restart: _restart,)
      ),
    );
  }
}
