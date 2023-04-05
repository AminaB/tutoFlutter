import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email address',

                ),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 12,),
              ElevatedButton(onPressed: (){

              },
                  child: Text('Login')
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
