import 'dart:convert';

import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart'  as http;

class Products with ChangeNotifier{
  List<Product> _items=[
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
Product findById(String id){
  return _items.firstWhere((element) => element.id==id);
}
  List<Product> get favoritesItems =>
      _items.where((element) => element.isFavorite).toList()  ;

  var _showFavoritesOnly=false;
  Future<void> addProduct(Product product){
    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json");
    return http.post(url,body: json.encode({
      'title': product.title,
      'description': product.description,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'isFavorite':product.isFavorite
    })).then((response) {
      final newP=Product(id: json.decode(response.body)['name'], title: product.title, description: product.description, price: product.price, imageUrl: product.imageUrl);
      _items.add(newP);
      notifyListeners();

    }).catchError((error){
      print(error);
      throw error;
    });
  }
  List<Product> get items => [..._items]  ;
     // _showFavoritesOnly ? _items.where((element) => element.isFavorite).toList():
  void showFavoritesOnly(){
    _showFavoritesOnly=true;
    notifyListeners();
  }
  void showAll(){
    _showFavoritesOnly=false;
    notifyListeners();
  }
  void updateProduct(String id, Product newProduct){
    final productIndex=_items.indexWhere((element) => element.id==id);
    if(productIndex>=0){
      _items[productIndex]=newProduct;
      notifyListeners();
    }else{
      print("...");
    }
  }
  void deleteproduct(String id){
    _items.removeWhere((element) => element.id==id);
    notifyListeners();
  }
}