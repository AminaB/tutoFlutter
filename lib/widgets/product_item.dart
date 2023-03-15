import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto_flutter/screens/product_detail_screen.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  //
  // const ProductItem(this.id, this.title, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context);
    return GridTile(
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon:  Icon(
                  product.isFavorite ? Icons.favorite: Icons.favorite_border
              ),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () { product.toggleFavoriteStatus() ;},),
            title: Text(product.title, textAlign: TextAlign.center ,),
            trailing: IconButton(
              icon:const Icon(
                Icons.shopping_cart,
              ),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {  },),

      ),
        ),
        child: GestureDetector(
          child: Image.network(
              product.imageUrl, fit: BoxFit.fill
          ),
          onTap: (){
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,arguments: product.id);
          } ,
        ),
    );
  }
}
