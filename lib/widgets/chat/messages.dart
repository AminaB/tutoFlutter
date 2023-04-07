import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/chat/message_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt', descending: true).snapshots(),
        builder: (context, chatSnapshot) {
          if(chatSnapshot.connectionState==ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          final chatDocs=chatSnapshot.data!.docs;
          return ListView.builder(
            reverse: true,
              itemCount: chatDocs.length,
              itemBuilder: (ctx,index)=>MessageBubble(chatDocs[index]['text']));
        },
    );
  }
}
