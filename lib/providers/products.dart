import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tuto_flutter/models/http_exception.dart';
import 'product.dart';
import 'package:http/http.dart'  as http;

class Products with ChangeNotifier{
    String authToken='';
    String userId='';
  void setToken(String token){
    authToken=token;
  }
    void setUserId(String id){
      userId=id;
    }
    void setItems(items){
    if(items!=null){
      _items=items;
    }else{
      _items=[];
    }
    }


  List<Product> _items=[
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //   'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //   'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //   'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //   'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];


  Product findById(String id){
  return _items.firstWhere((element) => element.id==id);
}
  List<Product> get favoritesItems =>
      _items.where((element) => element.isFavorite).toList()  ;

  var _showFavoritesOnly=false;

  Future<void> fetchAndSetProducts([bool filterByUser=false]) async{
    final filterString=filterByUser? 'orderBy="creatorId"&equalTo="$userId"' :'';
    var url=Uri.parse('https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json?auth=$authToken&$filterString');
    //print("object");

    try{
      final  response=await http.get(url);
      final extractedData=json.decode(response.body) as Map<String, dynamic>;
      if(extractedData==null){
        return;
      }
       url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/userFavorite/$userId.json?auth=$authToken");

      final favoriteResponse=await http.get(url);
      final favoriteData= json.decode(favoriteResponse.body);
      final List<Product> loadedProducts=[];
      extractedData.forEach((pId, pData) {
        //print(pData);
        loadedProducts.add(Product(
          id: pId.toString(),
          title: pData['title'],
          description:pData['description'],
          price:pData['price'],
          imageUrl: pData['imageUrl'],
          isFavorite :favoriteData==null? false : favoriteData[pId]?? false

        ));
      });
      _items=loadedProducts ;
      notifyListeners();

    }catch(error){
      throw(error);
    }

  }
  Future<void> addProduct(Product product) async{
    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json?auth=$authToken");
    try {
      final response = await http.post(url, body: json.encode({
        'title': product.title,
        'description': product.description,
        'price': product.price,
        'imageUrl': product.imageUrl,
        'creatorId': userId
      }));
      final newP=Product(id: json.decode(response.body)['name'], title: product.title, description: product.description, price: product.price, imageUrl: product.imageUrl);
      _items.add(newP);
      notifyListeners();
    }catch(error){
       print(error);
       throw error;
    }
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
  Future<void> updateProduct(String id, Product newProduct) async{

    final productIndex=_items.indexWhere((element) => element.id==id);
    if(productIndex>=0){
      final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products/$id.json?auth=$authToken");
      await http.patch(url,body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'imageUrl': newProduct.imageUrl,
        'price': newProduct.price,
        'isFavorite': newProduct.isFavorite

      }));
      _items[productIndex]=newProduct;
      notifyListeners();
    }else{
      print("...");
    }
  }
  Future<void> deleteProduct(String id) async{
    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products/$id.json?auth=$authToken");
    final existingProductIndex= _items.indexWhere((element) => element.id==id);
    Product? existingProduct=_items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response=await http.delete(url);
      if(response.statusCode>=400){
        _items.insert(existingProductIndex, existingProduct);
        notifyListeners();
        throw HttpException('Could not delete product.');
      }
      existingProduct=null;



    notifyListeners();
  }
}