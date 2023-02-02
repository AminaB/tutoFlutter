import 'package:flutter/cupertino.dart';
import 'package:tuto_flutter/widgets/transaction_list.dart';

import '../models/transaction.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction=[
    Transaction('t1:', 'New shoes',69.99, DateTime.now(),),
    Transaction('t2:', 'Groceries',16.53, DateTime.now(),)
  ];
  void _addNewTransaction(String title,double amount){
    final newTx= Transaction( DateTime.now().toString(),title, amount, DateTime.now());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Newtransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
