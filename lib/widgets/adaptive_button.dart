import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final VoidCallback  handler;

  AdaptiveFlatButton(this.text, this.handler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold))
        )
        : TextButton(
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.purple)),
        onPressed: handler,
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold),)
    );
  }
}
