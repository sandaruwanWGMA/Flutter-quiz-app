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
    } else if (correctAnswers <= (totalQuestions * 0.75).toInt()) {
      comment = "Average";
      color = Colors.green;
    } else if (correctAnswers > (totalQuestions * 0.75).toInt()) {
      comment = "Good";
      color = Colors.blue;
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 227, 245, 236),
                Color.fromARGB(255, 201, 200, 200)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
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
                TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Adjust the radius as needed
                    ),
                    backgroundColor: const Color.fromARGB(15, 158, 158, 158),
                    foregroundColor: Colors.orange,
                    side: const BorderSide(
                      width: 0.5,
                      color: Color.fromARGB(212, 255, 153, 0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Quiz(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.restart_alt,
                  ),
                  label: const Text(
                    "Restart quiz",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
