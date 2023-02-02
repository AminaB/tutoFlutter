import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';


void main() {
  runApp(Myapp());
}

class Myapp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatelessWidget {
final List<Transaction> transactions=[
  Transaction('t1:', 'New shoes',69.99, DateTime.now(),),
  Transaction('t2:', 'Groceries',16.53, DateTime.now(),)
];
late String titleInput;
late String amountInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color:Colors.blue,
              child:Text('CHART'),
              elevation: 5,
            ),
          ),
          Card(child:
            Container(
              padding: EdgeInsets.all(10),
              child: Column(crossAxisAlignment:CrossAxisAlignment.end, children: [
                TextField(
                    decoration:InputDecoration(labelText: 'Title'),
                    onChanged: (value) => titleInput=value,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'amount'),
                  onChanged: (value) => amountInput=value,
                ),
                TextButton(
                    onPressed:()  {
                        print(titleInput); print(amountInput);
                      },
                  child: Text('Add transaction'),
                  style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.purple)),
                )

              ],),
            )
            ,),
          Column(
            children : transactions.map((e) =>
            Card(
              elevation: 5,
              child:Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    decoration: BoxDecoration(border:Border.all(color: Colors.purple,width: 2)),
                    padding: EdgeInsets.all(10),
                    child: Text('£' + e.amount.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),

                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15 ),),
                      Text(DateFormat().format(e.date),style: TextStyle(color: Colors.grey,fontSize:10 ))
                  ],
                  ),
                ],

              ),
              )
            ).toList(),
          )

        ],
      ),
    );

  }
}
