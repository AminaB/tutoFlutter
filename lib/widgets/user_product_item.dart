import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto_flutter/providers/products.dart';
import 'package:tuto_flutter/screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;


  UserProductItem(this.title, this.imageUrl, this.id);

  @override
  Widget build(BuildContext context) {
    final scaffold=ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: (){Navigator.of(context).pushNamed(EditProductsScreen.routeName,arguments: id);},
              icon: Icon(Icons.edit),color: Theme.of(context).colorScheme.primary,
            ),
            IconButton(
              onPressed: () async{
                try{
                  await Provider.of<Products>(context,listen: false).deleteProduct(id);

                }catch(error){
                 scaffold.showSnackBar(const SnackBar(content: Text('Deleting failed',textAlign: TextAlign.center,)));
                }
              },
              icon: Icon(Icons.delete),color: Theme.of(context).colorScheme.error,
            )
          ],
        ),
      ),
    );
  }
}
