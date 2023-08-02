import 'package:flutter/material.dart';
import 'package:flutter_quiz/questions_screen.dart';
import 'package:flutter_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? _currentScreen;

   void startQuiz() {
    setState(() {
      _currentScreen = const QuestionsScreen();
    });
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
