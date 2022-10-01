import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final void Function() submitFunction;
  final String label;
  final TextInputType inputType;
  final TextEditingController textfieldController;

  AdaptativeTextField({
    required this.label,
    required this.submitFunction,
    this.inputType = TextInputType.text,
    required this.textfieldController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: textfieldController,
              onSubmitted: (_) => submitFunction(),
              placeholder: label,
              keyboardType: inputType,
            ),
          )
        : TextField(
            controller: textfieldController,
            onSubmitted: (_) => submitFunction(),
            decoration: InputDecoration(
              labelText: label,
            ),
            keyboardType: inputType,
          );
  }
}
