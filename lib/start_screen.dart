import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/quiz-logo.png"),
          const SizedBox(height: 48),
          const Text(
            "Learn flutter in fun way",
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          OutlinedButton(
            onPressed: () {
              switchScreen();
            },
            child: const Text("Start quiz"),
          ),
        ],
      ),
    );
  }
}
