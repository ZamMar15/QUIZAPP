import 'package:flutter/material.dart'; //to unlock stateless widget class
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,
      {/* to automatically set the vlaue we get for argument for the varaible */ super.key /* curly braces to accept named arguments accpet argument name key and foward it to the class called super */});
  final void Function()? startQuiz;
  @override //annotation overriding method
  Widget build(context) {
    //build method  returns a value of type widget accepts a context argument
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize
            .min, //column widget takes min vertical widget as needed
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(255, 207, 194, 192),
          ),
          // Opacity(   -->transparency of image
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(
            height: 100,
          ),
          Text(
            'learn flutter the easy way',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
