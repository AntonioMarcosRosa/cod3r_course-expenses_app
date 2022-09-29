import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) removeTransaction;

  const TransactionList(this.transactions, this.removeTransaction, {super.key});

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
              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 6,
                ),
                child: ListTile(
                  trailing: MediaQuery.of(context).size.width > 480
                      ? TextButton.icon(
                          onPressed: () =>
                              removeTransaction(transaction.id as String),
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          label: Text('Excluir',
                              style: TextStyle(
                                  color: Theme.of(context).errorColor)),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Theme.of(context).errorColor,
                          ),
                          onPressed: () =>
                              removeTransaction(transaction.id as String),
                        ),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        child: Text(
                          'R\$ ${transaction.value!.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction.title as String,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(transaction.date),
                  ),
                ),
              );
            });
  }
}
