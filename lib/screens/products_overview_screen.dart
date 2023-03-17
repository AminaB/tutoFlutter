import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
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
          ),
          Consumer<Cart>(builder: (context, cartData, ch) =>    Badge(
            label: Text(cartData.itemCount.toString()),
            child:ch,
          ) ,
              child : IconButton(
                icon:const Icon(Icons.shopping_cart) ,
                onPressed: () {  },
              )
          ),

        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}

