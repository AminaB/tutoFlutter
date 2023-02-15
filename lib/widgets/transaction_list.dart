import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5

          ),
          child: ListTile(
            leading: CircleAvatar(radius: 30,
              child: Padding(padding: const EdgeInsets.all(6),child: FittedBox(child: Text('£${transactions[index].amount}'),),),
            ),
            title: Text(
              transactions[index].title,
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize:15 )
            ),
            subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),style: const TextStyle(color: Colors.grey,fontSize:10 )),
            trailing: MediaQuery.of(context).size.width>460?TextButton.icon(
                onPressed: ()=>deleteTx(transactions[index].id),
                icon: const Icon(Icons.delete),
                label: const Text('delete'),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.red),
                )
            ):
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: ()=>deleteTx(transactions[index].id),

            ),
          ),
        );
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
