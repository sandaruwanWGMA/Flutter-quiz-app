import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/Data/questions.dart';
import 'package:flutter_quiz_app/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  int questionNumber = 0;
  int answeredQuestions = 0;

  void stepUpQuestionNumber() {
    answeredQuestions++;

    if (answeredQuestions >= questions.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResultScreen(),
        ),
      );
    }

    setState(() {
      questionNumber++;
    });
  }

  @override
  Widget build(context) {
    var shuffledAnswers = questions[questionNumber].answers.toList()..shuffle();
    print(questions[questionNumber].answers.toList());
    print("hello");
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/bgImage.jpeg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[questionNumber].question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            ...shuffledAnswers.map(
              (answer) => Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(130, 38, 38, 39),
                      Color.fromARGB(130, 35, 51, 67),
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                margin: const EdgeInsets.only(
                  bottom: 12,
                ),
                child: TextButton(
                  onPressed: stepUpQuestionNumber,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    answer,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
