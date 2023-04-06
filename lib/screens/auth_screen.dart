import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tuto_flutter/widgets/auth/aut_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth=FirebaseAuth.instance;
  var _isLoading=false;
  void _submitAuthForm(String email, String password, String username, bool isLogin, BuildContext ctx)async{
    UserCredential authResult;
    try {
      setState(() {
        _isLoading=true;
      });
      Firebase.initializeApp();
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await FirebaseFirestore.instance.collection('users').doc(authResult.user!.uid).set({
          'username': username,
          'email': email,
        });

      }
    }on PlatformException catch(err){
      String message= ' An error occurred, please check your credentials!';
      if(err.message!=null){
        message=err.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Theme.of(ctx).colorScheme.error,
          )
      );
      setState(() {
        _isLoading=false;
      });
    }catch(err){
      print(err);
      setState(() {
        _isLoading=false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: AuthForm(_submitAuthForm,_isLoading),
    );
  }
}
