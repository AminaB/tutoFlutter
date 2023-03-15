import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/Products_grid.dart';

enum FilterOptions{
  Favorites,
  All,
}
class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites=false;
  @override
  Widget build(BuildContext context) {
    final productsContainer=Provider.of<Products>(context,listen:false);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selected){
              setState(() {
                if(selected==FilterOptions.Favorites){
                  _showOnlyFavorites=true;
                }else{
                  _showOnlyFavorites=false;

                }
              });

            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context)=> [
              const PopupMenuItem(value:FilterOptions.Favorites, child: Text("only Favorites")),
              const PopupMenuItem(value:FilterOptions.All, child: Text("Show All"))

            ]
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}

