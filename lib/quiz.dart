import 'package:flutter/material.dart';
import 'package:kodlabquiz/WelcomePage.dart';
import 'package:kodlabquiz/data/questions.dart';
import 'package:kodlabquiz/questions_screen.dart';
import 'package:kodlabquiz/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = "welcome-screen";

  @override
  initState() {
    activeScreen = "welcome-screen";
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = WelcomePage(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "results-screen") {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF6A0DAD),
                Color(0xFF7A1BB1),
                Color(0xFF8B29B5),
                Color(0xFF9C37B9),
                Color(0xFFAD45BD),
                Color(0xFFBE53C1),
                Color(0xFFCF61C5),
                Color(0xFFE070C9),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
