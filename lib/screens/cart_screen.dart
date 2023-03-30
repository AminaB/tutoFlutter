import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/orders.dart';
import '../widgets/cart_item.dart' as ci;



class CartScreen extends StatelessWidget {
  static const routeName='/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart=Provider.of<Cart>(context);
    return  Scaffold(
      appBar: AppBar(title: Text('Your Cart'),),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total',style: TextStyle(fontSize: 20,),),
                  const Spacer(),
                  Chip(label: Text('\$${cart.totalAmount.toStringAsFixed(2)}'),backgroundColor: Theme.of(context).colorScheme.primary,),
                  OrderButton(cart: cart)
                  

                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(child: ListView.builder(
              itemBuilder: (ctx, index) => ci.CartItem(
                  cart.items.values.toList()[index].id,
                  cart.items.keys.toList()[index],
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].quantity,
                  cart.items.values.toList()[index].title),
              itemCount: cart.itemCount,
          )
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading=false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (widget.cart.totalAmount<=0 || _isLoading)? null: () async{
        setState(() {
          _isLoading=true;
        });
        await Provider.of<Orders>(context, listen: false).addOrder(widget.cart.items.values.toList(), widget.cart.totalAmount);
        setState(() {
          _isLoading=false;
        });
        widget.cart.clear();
      },
      style: TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.primary,
    ), child: _isLoading?const CircularProgressIndicator(): const Text('Order Now'),);
  }
}
