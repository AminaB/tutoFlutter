import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  //final String title;
  static const routeName='/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('title'),),
    );
  }
}
