

import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/chart.dart';
import 'package:tuto_flutter/widgets/new_transaction.dart';
import 'package:tuto_flutter/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(Myapp());
}

class Myapp  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal expense',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',


      ),
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late String titleInput;

late String amountInput;
final List<Transaction> _userTransaction=[
  Transaction('t1:', 'New shoes',69.99, DateTime.now(),),
  Transaction('t2:', 'Groceries',16.53, DateTime.now(),),
  Transaction('t1:', 'New shoes',69.99, DateTime.now(),),
  Transaction('t2:', 'Groceries',16.53, DateTime.now(),),
  Transaction('t1:', 'New shoes',69.99, DateTime.now(),),
  Transaction('t2:', 'Groceries',16.53, DateTime.now(),),
  Transaction('t1:', 'New shoes',69.99, DateTime.now(),),
  Transaction('t2:', 'Groceries',16.53, DateTime.now(),)
];
void _addNewTransaction(String title,double amount,DateTime chosenDate){
  final newTx= Transaction( DateTime.now().toString(),title, amount, chosenDate);
  setState(() {
    _userTransaction.add(newTx);
  });
}
List<Transaction> get _recentTransactions{
  return _userTransaction.where((element) =>
     element.date.isAfter(DateTime.now().subtract(Duration(days: 7)))
  ).toList();
}
void _startAddNewTransaction(BuildContext ctx){
  showModalBottomSheet(context: ctx, builder: (bCtx){
    return Newtransaction(_addNewTransaction);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal expense'),
        actions: [
          IconButton( onPressed: ()=>_startAddNewTransaction(context), icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(_recentTransactions),
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_startAddNewTransaction(context),
      ),
    );

  }
}
