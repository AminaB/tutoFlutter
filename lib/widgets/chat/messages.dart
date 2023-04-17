import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:  Future<User>.value(FirebaseAuth.instance.currentUser),
      builder:(context, futureSnapshot){
        if(futureSnapshot.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
       return  StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt', descending: true).snapshots(),
        builder: (context, chatSnapshot) {
          if(chatSnapshot.connectionState==ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          final chatDocs=chatSnapshot.data!.docs;
          print(chatDocs);
          return ListView.builder(
                  reverse: true,
                  itemCount: chatDocs.length,
                  itemBuilder: (ctx,index)=>MessageBubble(
                    chatDocs[index]['text'],
                    (chatDocs[index]['userId']==futureSnapshot.data!.uid),
                    chatDocs[index]['username'],
                    chatDocs[index]['userImage'],
                    key: ValueKey(chatDocs[index].id),
                  ),
              );
            }) ;

        },
    );
  }
}
