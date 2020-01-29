import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;
  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (totalScore == 30) {
      resultText = 'your knowledge is great';
    } else if (totalScore < 30 && totalScore > 10) {
      resultText = 'Need some improvement';
    } else {
      resultText = 'Go get some knowledge';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    print(totalScore);
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'You Scored: ' + totalScore.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            resultPhrase,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            child: Text('Reset Quiz'),
            textColor: Colors.blue,
            onPressed: resetQuiz,
          )
        ],
      ),
    ));
  }
}
