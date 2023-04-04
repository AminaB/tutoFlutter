import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:tuto_flutter/models/http_exception.dart';

class Auth with ChangeNotifier{
  late String _token;
  DateTime? _expiryDate;
  late String _userId;
  bool get isAuth{
    return token!=null;
  }
  String? get token{
    if(_expiryDate!=null && _expiryDate!.isAfter(DateTime.now()) && _token!=null){
      return _token;
    }
    return null;
  }

  String get userId => _userId;

  Future<void> _authenticate(String email, String password, String urlSegment) async{
    final url =Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAk68qMoW3ta7N5XecQPlfxu21-t6AesqA");
    print(url);
    try{
      final response=await http.post(url,body: json.encode({
        'email':email,
        'password':password,
        'returnSecureToken':true
      }));
      final responseData=json.decode(response.body);
      if(responseData['error']!=null){
        throw HttpException(responseData['error']['message']);
      }
      _token=responseData['idToken'];
      _userId=responseData['localId'];
      _expiryDate=DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
      notifyListeners();
    }catch(error){
      rethrow;
    }
    //    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json");

  }
  Future<void> signup(String email, String password) async{
   // final url =Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key= AIzaSyAk68qMoW3ta7N5XecQPlfxu21-t6AesqA");
    //    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json");
    return _authenticate(email, password, "signUp");

  }
  Future<void> login(String email, String password) async{
    //final url =Uri.parse("hhttps://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key= AIzaSyAk68qMoW3ta7N5XecQPlfxu21-t6AesqA");
    //    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json");
    return _authenticate(email, password, "signInWithPassword");
  }
}