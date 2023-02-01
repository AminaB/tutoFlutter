import 'package:flutter/material.dart';
import 'package:tuto_flutter/Answer.dart';
import 'package:tuto_flutter/QuestionWidget.dart';

import 'Question.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyappState();
  }
}

class _MyappState extends State<Myapp> {
  final _quetions = [
    {
      'questionText': 'Your color',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'Your animal',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText': 'Your Instructor',
      'answers': ['Max', 'Max', 'Max', 'Max']
    }
  ];
  int _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _quetions.length
            ? QuestionWidget(_quetions, _answerQuestion, _questionIndex)
            : Center(
                child: Text('End'),
              ), //
      ),
    );
  }
}
