import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const ProductItem(this.id, this.title, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: const Icon(Icons.favorite),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {  },),
            title: Text(title, textAlign: TextAlign.center ,),
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
              imageUrl, fit: BoxFit.fill
          ),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ProductDetailScreen(title)));
          } ,
        ),
    );
  }
}
