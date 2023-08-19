import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz_screen.dart';

import 'package:flutter_quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    // TODO: implement initState
    activeScreen = StartScreen(switchScreen);

    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuizScreen();
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: activeScreen,
        ),
      ),
    );
  }
}
