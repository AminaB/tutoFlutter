import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Newtransaction extends StatelessWidget {
  final Function addTx;
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
              ),
              TextField(
                decoration: InputDecoration(labelText: 'amount'),
                controller: amountController,
                //onChanged: (value) => amount=value,
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
