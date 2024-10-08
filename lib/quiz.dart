import 'package:flutter/material.dart';

import 'package:adv_basic/start_screen.dart';
import 'package:adv_basic/questions_screen.dart';
import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
/*import 'package:adv_basic/data/questions.dart';
import 'package:adv_basic/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basic/start_screen.dart';
import 'package:adv_basic/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Widget?  activeScreen; // =const StartScreen(switchScreen/*dont pass parenthesis --() it would execute function ea*/ ); //storing widget inside of variable used widget in place of var as var is restrictive
  var activeScreen =
      'start-screen'; //--->>>rendered diff screen by storing the screen in active screen variable

  /* void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  } */

  void switchScreen() {
    setState(
      () {
        // activeScreen = const QuestionsScreen();

        activeScreen = 'questions-screen';
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(
        () {
          //selectedAnswers = [];
          activeScreen = 'results-screen';
        },
      );
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        choosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 95, 59, 102),
                Color.fromARGB(255, 177, 164, 179)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // child: activeScreen,
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //    : const QuestionsScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}  // _ to denote private class 
*/