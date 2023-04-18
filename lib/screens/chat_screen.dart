import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:tuto_flutter/widgets/chat/messages.dart';
import 'package:tuto_flutter/widgets/chat/new_message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    final fbm=FirebaseMessaging.instance;
    fbm.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message);
      // PushNotification notification = PushNotification(
      //   title: message.notification?.title,
      //   body: message.notification?.body,
      // );
    });

    super.initState();
  }
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
          NewMessage(),
        ],),
      ),
    );
  }
}
