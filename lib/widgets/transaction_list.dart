import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
final List<Transaction> transactions;

TransactionList(this.transactions);

@override
  Widget build(BuildContext context) {
    return   Container(
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                child:Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      decoration: BoxDecoration(border:Border.all(color: Colors.purple,width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text('£' + transactions[index].amount.toStringAsExponential(2),
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.purple),

                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(transactions[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15 ),),
                        Text(DateFormat().format(transactions[index].date),style: TextStyle(color: Colors.grey,fontSize:10 ))
                      ],
                    ),
                  ],

                ),
              );
            }
        ,

      )
    );
  }
}
