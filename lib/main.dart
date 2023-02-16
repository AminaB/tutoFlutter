import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
List<Widget> _buildLandscapeContent(MediaQueryData mediaQuery, PreferredSizeWidget appBar, Widget txtListWidget){
return [Row(children: [
  Text('show Chart'),
  Switch.adaptive(activeColor: Theme.of(context).accentColor,value: _showChart, onChanged: (val){

    setState(() {
      _showChart=val;
    });
  },)
],),_showChart?
Container(
    height:(mediaQuery.size.height-appBar.preferredSize.height - mediaQuery.padding.top*0.7),
    child: Chart(_recentTransactions)
):txtListWidget];
}
List<Widget> _buildPortraitContent(MediaQueryData mediaQuery, PreferredSizeWidget appBar, Widget txtListWidget){
  return [Container(
      height:(mediaQuery.size.height-appBar.preferredSize.height - mediaQuery.padding.top)*0.3,
      child: Chart(_recentTransactions)
  ),txtListWidget];
}
  @override
  Widget build(BuildContext context) {
  final mediaQuery=MediaQuery.of(context);
  final isLandScape =mediaQuery.orientation==Orientation.landscape;
  final  PreferredSizeWidget appBar;
  if (Platform.isIOS) {
    appBar = CupertinoNavigationBar(
        middle: Text('Personal expense'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Icon(CupertinoIcons.add),
              onTap: ()=> _startAddNewTransaction(context),
            )
          ],
        ),
      );
  } else {
    appBar = AppBar(
        title: Text('Personal expense'),
        actions: [
          IconButton( onPressed: ()=>_startAddNewTransaction(context), icon: Icon(Icons.add))
        ],
      );
  }
  final txtListWidget=  Container(
      height:(mediaQuery.size.height-appBar.preferredSize.height- mediaQuery.padding.top*0.7),
      child: TransactionList(_userTransaction,_deleteTransaction)
  );
  final pageBody=SafeArea(
    child: SingleChildScrollView(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if(isLandScape) ..._buildLandscapeContent(mediaQuery,appBar,txtListWidget),
          if(!isLandScape) ..._buildPortraitContent(mediaQuery,appBar,txtListWidget),

        ],
      ),
    ),
  );

  return Platform.isIOS? CupertinoPageScaffold(child: pageBody,navigationBar: appBar as ObstructingPreferredSizeWidget,):Scaffold(
      appBar: appBar,
      body: pageBody,
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
