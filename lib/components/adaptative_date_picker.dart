import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onDateChange;

  const AdaptativeDatePicker({
    required this.selectedDate,
    required this.onDateChange,
    super.key,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        onDateChange(pickedDate);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange,
            ),
          )
        : SizedBox(
            height: 80,
            child: Row(
              children: [
                Expanded(
                  child: Text(selectedDate != null
                      ? DateFormat('d MMM y').format(selectedDate)
                      : 'Nenhuma data selecionada!'),
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: const Text(
                    'Selecionar data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
  }
}
