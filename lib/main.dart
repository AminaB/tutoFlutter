import 'package:flutter/material.dart';
import 'package:tuto_flutter/Answer.dart';

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

  int _questionIndex=0;
  void answerQuestion(){
    setState(() {
      _questionIndex=_questionIndex+1;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    var quetions = ['Your color', 'your animal'];
    var _answer =[ 'Answer 1', 'Answer 2'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(children: [Question(quetions[_questionIndex]),
          Answer(answerQuestion),
          Answer(answerQuestion),

        ]
        ), //
      ),
    );
  }
}
