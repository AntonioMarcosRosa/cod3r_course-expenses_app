import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.removeTransaction,
    required this.transaction,
  }) : super(key: key);

  final void Function(String p1) removeTransaction;
  final Transaction transaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  
  Color? _backGround;

  var colors = [
    Colors.red,
    Colors.black,
    Colors.green,
    Colors.blue,
    Colors.deepPurple,
  ];

  @override
  void initState() {
    int randomNum = Random().nextInt(5);
    _backGround = colors[randomNum];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 6,
      ),
      child: ListTile(
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => widget.removeTransaction(widget.transaction.id as String),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: Text('Excluir',
                    style: TextStyle(color: Theme.of(context).errorColor)),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => widget.removeTransaction(widget.transaction.id as String),
              ),
        leading: CircleAvatar(
          backgroundColor: _backGround,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Text(
                'R\$ ${widget.transaction.value!.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title as String,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.transaction.date),
        ),
      ),
    );
  }
}
