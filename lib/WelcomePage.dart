// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage(this.startQuiz,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 270,
            color: const Color.fromARGB(150, 0, 0, 0),
          ),
          const SizedBox(
            height: 40,
            width: 40,
          ),
          Text(
            "Learn Programming the fun way!",
            style: GoogleFonts.manrope(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
          ),
          const SizedBox(
            height: 20,
            width: 20,
          ),
          FilledButton.tonalIcon(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFD8BFD8),
            ),
            onPressed: () {
              startQuiz();
            },
            icon: const Icon(Icons.arrow_circle_right_rounded),
            label: const Text(
              "Let's start!",
              style: TextStyle(
                color: Color.fromARGB(255, 78, 66, 66),
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
