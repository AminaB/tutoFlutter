import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final VoidCallback selectHandler;
  final String answer;
   Answer(this.selectHandler,this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // background
            disabledBackgroundColor: Colors.yellow, // foreground
          ),
          onPressed: selectHandler,
          child:Text(answer)
    ),
    );
  }


}
