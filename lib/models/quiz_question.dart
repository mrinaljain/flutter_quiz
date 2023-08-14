class QuizQuestion {
  final String text;
  final List<String> answers;

  const QuizQuestion(
    this.text,
    this.answers,
  );


  /// belo method is the example for using shuffle method on lists 
  ///  shuffle method changes the actual list , thats whay we are first making a copy of answer and then applying shuffle method to it.
  List<String> get shuffeledAnswers {
    final shuffeledAnswers = List.of(answers);
    shuffeledAnswers.shuffle();
    return shuffeledAnswers;
  }
}
