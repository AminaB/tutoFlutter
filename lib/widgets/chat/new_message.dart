import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _enteredMessage='';
  final _controller = TextEditingController();
  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user=await Future<User>.value(FirebaseAuth.instance.currentUser);
    final userData= await FirebaseFirestore.instance.collection("users").doc(user.uid).get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMessage,
      'createdAt' : Timestamp.now(),
      'userId': user.uid,
      'username': userData['username'],
    });
    _controller.clear();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Send a message...',
                ),
                onChanged: (value){
                  setState(() {
                    _enteredMessage=value;
                  });
                },
             )
          ),
          IconButton(
            onPressed: (){
              _enteredMessage.trim().isEmpty ? null: _sendMessage();
            },
            icon: Icon(Icons.send),
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    );
  }
}