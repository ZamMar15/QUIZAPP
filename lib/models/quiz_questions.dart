//blueprint for questions
class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text;
  final List<String> answers;
  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList
        .shuffle(); //list.of creates a new list based on existing ones <chaining>>
    return shuffledList;
  }
}
