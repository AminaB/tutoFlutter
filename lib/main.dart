import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyappState();
  }
}
class MyappState extends State<Myapp> {

  int questionIndex=0;
  void answerQuestion(){
    setState(() {
      questionIndex=questionIndex+1;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    var quetions = ['Your color', 'your animal'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(children: [Text(quetions[questionIndex]),
          ElevatedButton(onPressed: answerQuestion, child: Text('Answer1'),),
          ElevatedButton(onPressed: answerQuestion, child: Text('Answer2'),),

        ]
        ), //
      ),
    );
  }
}
