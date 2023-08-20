import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(this.correctAnswers, this.totalQuestions, {super.key});
  final int correctAnswers;
  final int totalQuestions;

  @override
  State<ResultScreen> createState() {
    return _ResultScreenState(correctAnswers, totalQuestions);
  }
}

class _ResultScreenState extends State<ResultScreen> {
  _ResultScreenState(this.correctAnswers, this.totalQuestions);
  final int correctAnswers;
  final int totalQuestions;
  var comment = "";
  Color color = Colors.transparent;

  @override
  Widget build(context) {
    if (correctAnswers <= (totalQuestions * 0.5).toInt()) {
      comment = "Below Average";
      color = Colors.red;
    }

    if (correctAnswers <= (totalQuestions * 0.75).toInt()) {
      comment = "Average";
      color = Colors.green;
    }

    if (correctAnswers > (totalQuestions * 0.75).toInt()) {
      comment = "Good";
      color = Colors.blue;
    }
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Out of $totalQuestions questions, $correctAnswers are correct",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Center(
                child: Text(
                  comment,
                  style: TextStyle(
                    color: color,
                    fontSize: 54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Quiz(),
                    ),
                  );
                },
                child: const Text("Restart quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
