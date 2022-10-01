import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  const AdaptativeButton(
      {required this.label, required this.onPressed, super.key});

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.button?.color,
              ),
            ),
            onPressed: () {},
          )
        : ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).textTheme.button?.color,
              ),
            ),
          );
  }
}
