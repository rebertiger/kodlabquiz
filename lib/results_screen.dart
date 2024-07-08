import 'package:flutter/material.dart';
import 'package:kodlabquiz/data/questions.dart';
import 'package:kodlabquiz/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestart});
  
  final List<String> chosenAnswers;
  final VoidCallback onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestionsNumber = questions.length;
    final correctQuestionsNumber = summaryData.where((data) {
      return data['chosen_answer'] == data['correct_answer'];
    }).length;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
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
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $correctQuestionsNumber out of $totalQuestionsNumber questions correctly!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                QuestionsSummary(summaryData: getSummaryData()),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  onPressed: onRestart,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFD8BFD8),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    "Restart Quiz!",
                    style: TextStyle(color: Colors.white),
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
