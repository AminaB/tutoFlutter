import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuto_flutter/widgets/adaptive_button.dart';


class Newtransaction extends StatefulWidget {
  final Function addTx;

  Newtransaction(this.addTx);

  @override
  State<Newtransaction> createState() => _NewtransactionState();
}

class _NewtransactionState extends State<Newtransaction> {
  final titleController= TextEditingController();
  final amountController= TextEditingController();
  DateTime?  _selectedDate=null;
  void _submitData(){
    if(amountController.text.isEmpty){
      return ;
    }
    if( titleController.text.isEmpty || double.parse(amountController.text)<0 || _selectedDate==null){
      return;
    }
    widget.addTx(
      titleController.text,
      double.parse(amountController.text),
      _selectedDate,
    );
    Navigator.of(context).pop();
  }
  void _presentDatePicker(){
    showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime(2023), 
        lastDate: DateTime.now()
    ).then(
            (value) {
              if(value==null){
                return;
              }
              setState((){
                _selectedDate=value;
              });
            }
    );
    
  }


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Card(
        child:
          Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom+10),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration:const InputDecoration(labelText: 'Title'),
                  controller: titleController,
                  onSubmitted: (_)=> _submitData,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'amount'),
                  controller: amountController,
                  keyboardType:  const TextInputType.numberWithOptions(decimal: false),
                  //onChanged: (value) => amount=value,
                  onSubmitted: (_)=> _submitData,
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(child: Text(_selectedDate==null?'No Date Chosen!':DateFormat.yMd().format(_selectedDate!),)),

                    AdaptiveFlatButton('Choose Date', _presentDatePicker)

                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed:_submitData,
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                  ),
                  child: const Text('Add transaction'),
                )

              ],
            ),
          )
        ,),
    );
  }
}
