import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 204, 43, 94),
          Color.fromARGB(255, 117, 58, 136),
        ]),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/quiz-logo.png",
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(height: 48),
            const Text(
              "Learn flutter in fun way",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 32,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                side: const BorderSide(width: 1, color: Colors.white),
              ),
              onPressed: () {
                switchScreen();
              },
              child: const Text("Start quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
