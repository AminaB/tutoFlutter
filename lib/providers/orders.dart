import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'cart.dart';
class OrderItem{
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem(this.id, this.amount, this.products, this.dateTime);
}
class Orders with ChangeNotifier{
  List<OrderItem> _orders=[];

  List<OrderItem> get orders => [..._orders];
  Future<void> addOrder(List<CartItem> cartProducts, double total) async{
    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/orders.json");
    final timestamp=DateTime.now();
    final response=await http.post(url,body: json.encode({
      'amount': total,
      'dateTime':timestamp.toIso8601String(),
      'products': cartProducts
          .map((e) => {
            'id':e.id,
            'title': e.title,
            'quantity': e.quantity,
            'price': e.price,

        }).toList(),

    }));
    _orders.insert(0, OrderItem(json.decode(response.body)['name'], total, cartProducts, timestamp));
    notifyListeners();
  }

}