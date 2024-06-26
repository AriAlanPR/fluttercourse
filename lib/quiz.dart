import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final VoidCallback answerQuestion;
  final int questionIndex;

  const Quiz(
      {Key? key, required this.questions,
      required this.answerQuestion,
      required this.questionIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]["questionText"].toString(),
        ),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(answerQuestion, answer["text"].toString());
        })
      ],
    );
  }
}
