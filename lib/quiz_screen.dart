import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/Data/questions.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  int questionNumber = 0;

  void stepUpQuestionNumber() {
    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questions[questionNumber].question,
          textAlign: TextAlign.center,
        ),
        ...questions[questionNumber].answers.map((answer) => TextButton(
              onPressed: stepUpQuestionNumber,
              child: Text(answer),
            )),
      ],
    );
  }
}
