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
              Container(
                height: 70,
                child: Row(
                  children: [
                    Text('No Date Chosen!'),
                    TextButton(
                        style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.purple)),
                        onPressed: ()=>null,
                        child: Text('Choose date', style: TextStyle(fontWeight: FontWeight.bold),)
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed:submitData,
                child: Text('Add transaction'),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                ),
              )

            ],
          ),
        )
      ,);
  }
}
