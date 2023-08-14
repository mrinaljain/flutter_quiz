import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/result_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? _currentScreen;
  List<String> _selectedAnswers = [];
  void startQuiz() {
    setState(() {
      _currentScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _currentScreen = ResultScreen(
          chosenAnswers: _selectedAnswers,
          restartQuiz: restartQuiz,
        );
      });
    }
  }

  void restartQuiz() {
    _selectedAnswers = [];
    startQuiz();
  }

  @override
  void initState() {
    // TODO: implement initState
    _currentScreen = StartScreen(startQuiz);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purple,
              ],
            ),
          ),
          child: _currentScreen,
        ),
      ),
    );
  }
}
