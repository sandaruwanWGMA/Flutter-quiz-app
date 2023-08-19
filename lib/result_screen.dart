import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() {
    return _ResultScreenState();
  }
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: TextButton(
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
        ),
      ),
    );
  }
}
