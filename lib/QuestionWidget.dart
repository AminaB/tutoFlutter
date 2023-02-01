import 'package:flutter/cupertino.dart';

import 'Answer.dart';
import 'Question.dart';

class QuestionWidget extends StatelessWidget {
  final List<Map<String, Object>> quetions;
  final VoidCallback answerQuestion;
  final int questionindex;


  QuestionWidget(this.quetions, this.answerQuestion,this.questionindex);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Question((quetions[questionindex]['questionText']) as String),
      ...((quetions[questionindex]['answers']) as List<String>)
          .map((answer) => Answer(answerQuestion, answer))
          .toList()
    ]);
  }
}
