import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(const MyApp());

void _print(String text) {
  if (kDebugMode) {
    print(text);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);
  var _questionIndex = 0;
  final questions = [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1}
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Rabbit", "score": 3},
        {"text": "Snake", "score": 11},
        {"text": "Elephant", "score": 5},
        {"text": "Lion", "score": 10}
      ]
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answers": [
        {"text": "A", "score": 7},
        {"text": "B", "score": 5},
        {"text": "C", "score": 2},
        {"text": "D", "score": 4}
      ]
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
    _print(_questionIndex.toString());
    if (_questionIndex < questions.length) {
      _print("We have more questions!");
    } else {
      _print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Add more properties as needed
    return MaterialApp(
      theme: ThemeData.from(colorScheme: _colorScheme),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Test App'),
          backgroundColor: _colorScheme.inversePrimary,
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : const Result(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _print("calling local notification");
          },
          child: const Icon(Icons.notifications),
        ),
      ),
    );
  }
}
