import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdabtiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;
  AdabtiveFlatButton(this.text, this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        : TextButton(
            onPressed: handler,
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
