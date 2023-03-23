import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProductsScreen extends StatefulWidget {
  static const routeName='/edit-product';
  @override
  State<EditProductsScreen> createState() => _EditProductsScreenState();
}

class _EditProductsScreenState extends State<EditProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Edit Product'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title',),
                textInputAction: TextInputAction.next,
              )
            ],
          ),
        ),
      ),
    );
  }
}
