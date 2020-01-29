import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void answerQuestion(int score) {
    setState(() {
      questionIndex = questionIndex + 1;
      totalScore += score;
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'HTML Stands For ?',
        'answers': [
          {'text': 'Hyper Text Markup Language', 'score': 10},
          {'text': 'Hyper Type Markup language', 'score': 0},
          {'text': 'Hyperlinks Text Markup Language', 'score': 0},
          {'text': 'None of above', 'score': 0}
        ]
      },
      {
        'questionText': 'ReactJS is developed by ?',
        'answers': [
          {'text': 'Google', 'score': 0},
          {'text': 'Facebook', 'score': 10},
          {'text': 'Amazon', 'score': 0},
          {'text': 'Apple', 'score': 0}
        ]
      },
      {
        'questionText': 'Linux is created by ?',
        'answers': [
          {'text': 'Mark Zuckerberg', 'score': 0},
          {'text': 'Bill Gates', 'score': 0},
          {'text': 'Steve Jobs', 'score': 0},
          {'text': 'Linux Trovalds', 'score': 10}
        ]
      },
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Center(
              child: Text(
                'Quiz',
                style: (TextStyle(color: Colors.black)),
              ),
            ),
          ),
          body: Padding(
              padding: EdgeInsets.all(8.0),
              child: questionIndex < questions.length
                  ? Quiz(
                      questions: questions,
                      answerQuestion: answerQuestion,
                      questionIndex: questionIndex)
                  : Result(totalScore, resetQuiz)),
        ));
  }
}
