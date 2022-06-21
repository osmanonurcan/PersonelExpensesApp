import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:personal_expenses_app/widgets/transactionItem.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: [
                Container(
                  height: constraints.maxHeight * 0.1,
                  child: FittedBox(
                    child: Text(
                      "No Transactions",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                ),
                Container(
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                  height: constraints.maxHeight * 0.6,
                ),
              ],
            );
          }))
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(
                  deleteTx: deleteTx, transaction: transactions[index]);
            },
            itemCount: transactions.length,
          );
  }
}
