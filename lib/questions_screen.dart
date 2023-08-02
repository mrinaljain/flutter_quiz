import 'package:flutter/material.dart';
// import 'package:flutter_quiz/models/quiz_question.dart';
import 'package:flutter_quiz/widgets/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // List<QuizQuestion>? _questions;

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[0];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQuestion.text,textAlign: TextAlign.center,),
            const SizedBox(height: 30),
            /// Spread Operator
            ...currentQuestion.answers.map((answer) => Answer(
              answerText: answer,
              onTap: () {},
            )),  
          ],
        ),
      ),
    );
  }
}
