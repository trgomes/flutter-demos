import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(
      id: "t1",
      date: DateTime.now(),
      title: "Novo tênis",
      value: 310.50,
    ),
    Transaction(
      id: "t2",
      date: DateTime.now(),
      title: "Conta luz",
      value: 211,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}