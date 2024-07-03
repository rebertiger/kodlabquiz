import 'package:flutter/material.dart';
import 'package:kodlabquiz/WelcomePage.dart';
import 'package:kodlabquiz/data/questions.dart';
import 'package:kodlabquiz/questions_screen.dart';

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

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'start-screen';
        selectedAnswers.clear();
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
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 203, 232, 226),
                Color.fromARGB(255, 185, 225, 215),
                Color.fromARGB(255, 167, 218, 205),
                Color.fromARGB(255, 149, 210, 194),
                Color.fromARGB(255, 131, 203, 183),
                Color.fromARGB(255, 113, 196, 172),
                Color.fromARGB(255, 95, 189, 162),
                Color.fromARGB(255, 77, 182, 151),
                Color.fromARGB(255, 59, 175, 140),
                Color.fromARGB(255, 41, 168, 129)
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
