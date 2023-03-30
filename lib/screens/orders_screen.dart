import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto_flutter/widgets/app_drawer.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';


class OrderScreen extends StatefulWidget {
  static const routeName='/orders';

  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  late Future _ordersFuture;
  Future _obtainOrdersFuture(){
  return Provider.of<Orders>(context,listen: false).fetchAndSetOrders();
  }
  @override
  void initState() {
    // TODO: implement initState
    _ordersFuture=_obtainOrdersFuture();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Orders'),),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future:_ordersFuture,
        builder:(ctx, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }else{
            if(snapshot.error!=null){
              return const Center(child:Text('An error occurred'));
            }else{
              return Consumer<Orders>(builder: (ctx, ordersData, child) => ListView.builder(
                itemCount: ordersData.orders.length,
                itemBuilder: (ctx, i) => OrderItem(ordersData.orders[i]),
              )
              );
            }
          }
        },
      )

    );
  }
}
