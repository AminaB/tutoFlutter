import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5

      ),
      child: ListTile(
        leading: CircleAvatar(radius: 30,
          child: Padding(padding: const EdgeInsets.all(6),child: FittedBox(child: Text('£${transaction.amount}'),),),
        ),
        title: Text(
            transaction.title,
            style: const TextStyle(fontWeight: FontWeight.bold,fontSize:15 )
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date),style: const TextStyle(color: Colors.grey,fontSize:10 )),
        trailing: MediaQuery.of(context).size.width>460?TextButton.icon(
            onPressed: ()=>deleteTx(transaction.id),
            icon: const Icon(Icons.delete),
            label: const Text('delete'),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.red),
            )
        ):
        IconButton(
          icon: const Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: ()=>deleteTx(transaction.id),

        ),
      ),
    );
  }
}
