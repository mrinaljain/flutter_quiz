import 'package:flutter/material.dart';
// import 'package:flutter_quiz/models/quiz_question.dart';
import 'package:flutter_quiz/widgets/answer_button.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
      widget.onSelectAnswer(selectedAnswer);
  
    if (currentQuestionIndex < questions.length) {
      setState(() {
        currentQuestionIndex++;
        // currentQuestionIndex += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 66, 24, 214),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            /// Spread Operator
            /// Spread operator merges  iterable list in the parent list
            /// Here we are converting the list into widget
            /// MAP will return new list , it will not change the existing list
            ...currentQuestion
                .shuffeledAnswers
                .map((answer) => AnswerButton(
                      answerText: answer,
                      onTap: () {
                        answerQuestion(answer);
                      },
                    )),
          ],
        ),
      ),
    );
  }
}
