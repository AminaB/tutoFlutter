import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Newtransaction extends StatelessWidget {
  final Function addTx;
  void submitData(){
    if( titleController.text.isEmpty || double.parse(amountController.text)<0){
      return;
    }
    addTx(
      titleController.text, double.parse(amountController.text)
    );
  }
  final titleController= TextEditingController();
  final amountController= TextEditingController();
  Newtransaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return  Card(
      child:
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.end, 
            children: [
              TextField(
                decoration:InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_)=> submitData,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'amount'),
                controller: amountController,
                keyboardType:  TextInputType.numberWithOptions(decimal: true),
                //onChanged: (value) => amount=value,
                onSubmitted: (_)=> submitData,
              ),
              TextButton(

                onPressed:()  { addTx(titleController.text,double.parse(amountController.text));
                  print(titleController.text);
                },

                child: Text('Add transaction'),
                style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.purple)),
              )
    
            ],
          ),
        )
      ,);
  }
}
