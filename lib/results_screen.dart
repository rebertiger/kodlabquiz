import 'package:flutter/material.dart';
import 'package:kodlabquiz/data/questions.dart';
import 'package:kodlabquiz/questions_summary.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'chosen_answer':chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestionsNumber = questions.length;
    final correctQuestionsNumber = summaryData.where((data){
      return data['chosen_answer'] == data ['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $correctQuestionsNumber out of $totalQuestionsNumber questions correctly'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text("Restart quiz!")),
          ],
        ),
      ),
    );
  }
}
