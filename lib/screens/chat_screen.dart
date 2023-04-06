import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/chat/messages.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [
          DropdownButton(
            icon:Icon(Icons.more_vert, color: Theme.of(context).primaryIconTheme.color,) ,
            onChanged: (itemIdentifier) => {
              if(itemIdentifier=='logout'){
                FirebaseAuth.instance.signOut(),
              }
            },
            items: [
              DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app,color: Colors.black,),
                        SizedBox(width: 8,),
                        Text('Logout'),
                      ],
                    ),
                  ),
              )
            ],
          )
        ],
      ),

      body:Container(
        child: Column(children: [
          Expanded(
              child: Messages(),
          ),
        ],),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          FirebaseFirestore.instance.collection('chats/hpT2vLafjVw2RAkVdGys/messages').add(
              {'text' : 'This was added by click'}
          );
        },
      ),
    );
  }
}
