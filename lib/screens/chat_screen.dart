import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

      body: StreamBuilder (
        stream: FirebaseFirestore.instance
            .collection('chats/hpT2vLafjVw2RAkVdGys/messages')
            .snapshots(),
        builder: (ctx, AsyncSnapshot<dynamic> streamSnapshot) {
          if(streamSnapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          final documents=streamSnapshot.data.docs;
          return ListView.builder(
            itemCount: streamSnapshot.data.docs.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[index]['text']),
            ),

          );
        },
      )
        ,
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
