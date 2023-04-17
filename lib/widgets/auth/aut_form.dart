import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/pickers/user_image_picker.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isLoading, {super.key});
  final bool isLoading;
  final void Function (String email, String password,String username, bool isLogin, BuildContext ctx) submitFn;
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey=GlobalKey<FormState>();
  var _isLogin=true;
  var _userEmail='';
  var _username='';
  var _userPassword='';
  void _trySubmit(){
    final isValid=_formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if(isValid){
      _formKey.currentState!.save();
      widget.submitFn(_userEmail,_userPassword,_username, _isLogin,context);
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
             if( !_isLogin)
                UserImagePicker(),
              TextFormField(
                key: const ValueKey('email'),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                ),
                onSaved: (newValue) {
                  _userEmail=newValue!;
                },
              ),
              if(!_isLogin)
              TextFormField(
                key: const ValueKey('username'),
                validator: (value){
                  if(value!.isEmpty || value.length<4){
                    return 'Please enter at least 4 characters.';
                  }
                  return null;
                },
                decoration: const InputDecoration(labelText: 'Username'),
                onSaved: (newValue) {
                  _username=newValue!;
                },
              ),
              TextFormField(
                key: const ValueKey('password'),
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
              if(widget.isLoading)
                CircularProgressIndicator(),
              if(!widget.isLoading)
                ElevatedButton(onPressed: _trySubmit,
                    child: Text(_isLogin? 'Login' :'Sign Up', style: TextStyle(color: Colors.white),)
                ),
              if(widget.isLoading)
                CircularProgressIndicator(),
              if(!widget.isLoading)
                TextButton(
                    onPressed: (){
                      setState(() {
                        _isLogin=!_isLogin;
                      });

                    },
                    child:  Text(_isLogin?'create New Account': 'I already have an account')
                )
            ],
          ),

          ),
        ),
      ),
    );
  }
}
