import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey=GlobalKey<FormState>();
  String _userEmail='';
  String _userName='';
  String _userPassword='';
  void _trySubmit(){
    final isValid=_formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _formKey.currentState!.save();
      print(_userEmail);
      print(_userName);
      print(_userPassword);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                ),
                onSaved: (newValue) {
                  _userEmail=newValue!;
                },
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty || value.length<4){
                    return 'Please enter at least 4 characters.';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Username'),
                onSaved: (newValue) {
                  _userName=newValue!;
                },
              ),
              TextFormField(
                validator: (value){
                  if(value!.isEmpty || value.length<7){
                    return 'Password must be at least 7 characters.';
                  }
                  return null;
                },

                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
                onSaved: (newValue) {
                  _userPassword=newValue!;
                },
              ),
              const SizedBox(height: 12,),
              ElevatedButton(onPressed: _trySubmit,
                  child: Text('Login', style: TextStyle(color: Colors.white),)
              ),
              TextButton(
                  onPressed: (){

                  },
                  child: const Text('create New Account')
              )
            ],
          ),

          ),
        ),
      ),
    );
  }
}
