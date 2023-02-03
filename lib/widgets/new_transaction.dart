import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Newtransaction extends StatefulWidget {
  final Function addTx;

  Newtransaction(this.addTx);

  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  void submitData(){
    if( titleController.text.isEmpty || double.parse(amountController.text)<0){
      return;
    }
    widget.addTx(
      titleController.text, double.parse(amountController.text)
    );
    Navigator.of(context).pop();
  }

  final titleController= TextEditingController();

  final amountController= TextEditingController();

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
                keyboardType:  const TextInputType.numberWithOptions(decimal: false),
                //onChanged: (value) => amount=value,
                onSubmitted: (_)=> submitData,
              ),
              TextButton(
                onPressed:submitData,


                child: Text('Add transaction'),
                style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.purple)),
              )

            ],
          ),
        )
      ,);
  }
}
