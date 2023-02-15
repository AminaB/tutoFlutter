import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
final List<Transaction> transactions;
final Function deleteTx;


const TransactionList(this.transactions, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return   transactions.isEmpty ?
    LayoutBuilder(builder: (ctx,constraints){
      return Column(
        children: [
          Text('no transaction added yet',style: Theme.of(context).textTheme.titleSmall,),
          const SizedBox(height: 10,),
          Container(
              height: constraints.maxHeight *0.6 ,
              child: Image.asset('assets/images/866-536x354.jpg',fit: BoxFit.cover,)
          )
        ],
      );
    }) :ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        return TransactionItem(transaction: transactions[index], deleteTx: deleteTx);
            // return Card(
            //   elevation: 5,
            //   child:Row(
            //     children: [
            //       Container(
            //         margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            //         decoration: BoxDecoration(border:Border.all(color: Theme.of(context).primaryColor,width: 2)),
            //         padding: EdgeInsets.all(10),
            //         child: Text('£' + transactions[index].amount.toStringAsFixed(2),
            //           style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).primaryColor),
            //
            //         ),
            //       ),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(transactions[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize:15 ),),
            //           Text(DateFormat().format(transactions[index].date),style: TextStyle(color: Colors.grey,fontSize:10 ))
            //         ],
            //       ),
            //     ],
            //
            //   ),
            // );
          }
      ,

    );
  }
}

