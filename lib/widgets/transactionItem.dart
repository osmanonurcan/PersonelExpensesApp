import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.deleteTx,
    @required this.transaction,
  }) : super(key: key);

  final Function deleteTx;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      elevation: 6,
      child: ListTile(
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: (() => deleteTx(transaction.id)),
                icon: const Icon(
                  Icons.delete,
                ),
                label: const Text("Delete"),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                onPressed: (() => deleteTx(transaction.id)),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
              ),
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                "\$${transaction.amount}",
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
      ),
    );
  }
}
