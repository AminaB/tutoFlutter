import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto_flutter/screens/product_detail_screen.dart';

import '../providers/cart.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // const ProductItem(this.id, this.title, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context);
    final cart=Provider.of<Cart>(context,listen:false);

    return   ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetailScreen.routeName,
                    arguments: product.id,
                  );
                },
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: Consumer<Product>(
                  builder: (ctx, product, child) => IconButton(
                    icon: Icon(
                      product.isFavorite ? Icons.favorite : Icons.favorite_border,
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    },
                  ),
                ),
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {cart.addItem(product.id, product.price, product.title);},
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          );
  }
}