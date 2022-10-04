import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) removeTransaction;

  TransactionList(this.transactions, this.removeTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(top: constraints.maxHeight * 0.05),
                      child: SizedBox(
                        height: constraints.maxHeight * 0.10,
                        child: Text(
                          'Nenhuma Transação Cadastrada!',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: constraints.maxHeight * 0.15),
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final transaction = transactions[index];
              return TransactionItem(
                  key: GlobalObjectKey(transaction),
                  removeTransaction: removeTransaction,
                  transaction: transaction);
            });
  }
}
