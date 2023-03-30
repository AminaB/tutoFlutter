import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{
  late String _token;
  late DateTime _expiryDate;
  late String _userId;
  Future<void> _authenticate(String email, String password, String urlSegment) async{
    final url =Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key= AIzaSyAk68qMoW3ta7N5XecQPlfxu21-t6AesqA");
    //    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json");
    final response=await http.post(url,body: json.encode({
      'email':email,
      'password':password,
      'returnSecureToken':true
    }));
    print(json.decode(response.body));
  }
  Future<void> signup(String email, String password) async{
   // final url =Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key= AIzaSyAk68qMoW3ta7N5XecQPlfxu21-t6AesqA");
    //    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json");
    return _authenticate(email, password, "signUp");

  }
  Future<void> login(String email, String password) async{
    final url =Uri.parse("hhttps://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key= AIzaSyAk68qMoW3ta7N5XecQPlfxu21-t6AesqA");
    //    final url=Uri.parse("https://flutter-update-14e05-default-rtdb.europe-west1.firebasedatabase.app/products.json");
    return _authenticate(email, password, "signInWithPassword");
  }
}