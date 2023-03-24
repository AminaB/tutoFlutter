import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto_flutter/providers/products.dart';
import 'package:tuto_flutter/screens/edit_product_screen.dart';
import 'package:tuto_flutter/widgets/app_drawer.dart';
import 'package:tuto_flutter/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName='/user-products';

  @override
  Widget build(BuildContext context) {
    final productsData=Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductsScreen.routeName);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemBuilder: (_, i) => Column(children: [
              UserProductItem(productsData.items[i].title, productsData.items[i].imageUrl,productsData.items[i].id),
              const Divider(),
            ]
            ),
            itemCount: productsData.items.length,
        ),
      ),

    );
  }
}
