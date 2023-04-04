import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier{
  late String _token;
  DateTime? _expiryDate;
  late String _userId;
  Timer? _authTimer;
  bool get isAuth{
    return (token!='' && token!=null);
  }
  String? get token{
    if(_expiryDate!=null && _expiryDate!.isAfter(DateTime.now()) && _token!=null && _token!=''){
      return _token;
    }
    return null;
  }

  String get userId => _userId;

  Future<void> _authenticate(String email, String password, String urlSegment) async{
    final url =Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAk68qMoW3ta7N5XecQPlfxu21-t6AesqA");
    try{
      final response=await http.post(url,body: json.encode({
        'email':email,
        'password':password,
        'returnSecureToken':true
      }));
      final responseData=json.decode(response.body);
      if(responseData['error']!=null){
      }
      _token=responseData['idToken'];
      _userId=responseData['localId'];
      _expiryDate=DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _autoLogout();
      notifyListeners();
      final prefs=await SharedPreferences.getInstance();
      final userData=json.encode({'token': _token, 'userId': _userId,'expiryDate': _expiryDate!.toIso8601String()});
      prefs.setString('userData', userData);
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
  Future<bool> tryAutoLogin() async{
    final prefs=await SharedPreferences.getInstance();
    //print(prefs.getString('userData'));
    //print(expiryDate.toString());
    if(!prefs.containsKey('userData')){
      return false;
    }
    final extractedUserData= json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    final expiryDate=DateTime.parse(extractedUserData['expiryDate'] as String);
    if(expiryDate.isBefore(DateTime.now())){
      return false;
    }
    _token=extractedUserData['token'];
    _userId=extractedUserData['userId'];
    _expiryDate=expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }
  Future<void> logout() async {
    _token='';
    _expiryDate=null;
    _userId='';
    if(_authTimer!=null){
      _authTimer!.cancel();
      _authTimer=null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    //prefs.remove('userData');
    prefs.clear();

  }
  void _autoLogout(){
    if(_authTimer!=null){
      _authTimer!.cancel();
    }
   final timeToExpiry= _expiryDate?.difference(DateTime.now()).inSeconds;
    _authTimer=Timer(Duration(seconds: timeToExpiry!), logout);
  }
}