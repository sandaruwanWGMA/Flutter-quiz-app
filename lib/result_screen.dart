import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/Model/result_question.dart';
import 'package:flutter_quiz_app/quiz.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen(
      this.correctAnswers, this.totalQuestions, this.listOfResultQuestions,
      {super.key});
  final int correctAnswers;
  final int totalQuestions;
  final List<ResultQuestion> listOfResultQuestions;

  @override
  State<ResultScreen> createState() {
    return _ResultScreenState(
        correctAnswers, totalQuestions, listOfResultQuestions);
  }
}

class _ResultScreenState extends State<ResultScreen> {
  _ResultScreenState(
      this.correctAnswers, this.totalQuestions, this.listOfResultQuestions);
  final int correctAnswers;
  final int totalQuestions;
  final List<ResultQuestion> listOfResultQuestions;

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

    print(listOfResultQuestions.length);
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
                  height: 24,
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
                const SizedBox(
                  height: 124,
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    children: <Widget>[
                      ...listOfResultQuestions.map(
                        (e) => Container(
                          margin: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: e.isCorrect
                                      ? Colors.blue
                                      : Colors.redAccent,
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                width: 70,
                                height: 70,
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      (e.index + 1).toString(),
                                      style: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.question,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 64,
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
