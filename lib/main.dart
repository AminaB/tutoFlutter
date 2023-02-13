import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuto_flutter/widgets/chart.dart';
import 'package:tuto_flutter/widgets/new_transaction.dart';
import 'package:tuto_flutter/widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
/*  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);*/
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
bool _showChart=false;
void _addNewTransaction(String title,double amount,DateTime chosenDate){
  final newTx= Transaction( DateTime.now().toString(),title, amount, chosenDate);
  setState(() {
    _userTransaction.add(newTx);
  });
}
void _deleteTransaction(String id){
  setState(() {
    _userTransaction.removeWhere((element) => element.id==id);
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
  final mediaQuery=MediaQuery.of(context);
  final isLandScape =mediaQuery.orientation==Orientation.landscape;
  final appBar=AppBar(
    title: Text('Personal expense'),
    actions: [
      IconButton( onPressed: ()=>_startAddNewTransaction(context), icon: Icon(Icons.add))
    ],
  );
  final txtListWidget=  Container(
      height:(mediaQuery.size.height-appBar.preferredSize.height- mediaQuery.padding.top*0.7),
      child: TransactionList(_userTransaction,_deleteTransaction)
  );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if(isLandScape)Row(children: [
              Text('show Chart'),
              Switch.adaptive(activeColor: Theme.of(context).accentColor,value: _showChart, onChanged: (val){

                setState(() {
                  _showChart=val;
                });
              },)
            ],),
            if(!isLandScape)
             Container(
                height:(mediaQuery.size.height-appBar.preferredSize.height - mediaQuery.padding.top)*0.3,
                child: Chart(_recentTransactions)
            ),
            if(!isLandScape)
            txtListWidget,
           if (isLandScape) _showChart?
           Container(
               height:(mediaQuery.size.height-appBar.preferredSize.height - mediaQuery.padding.top*0.7),
               child: Chart(_recentTransactions)
           ):txtListWidget
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ?Container()
          :FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: ()=>_startAddNewTransaction(context),
         ),
    );

  }
}
