import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
    required this.onRemoved,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (cxt, index) => Dismissible(
            onDismissed: (direction) {
              onRemoved(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            child: ExpensesItem(expenses[index]),
          ),
    );
  }
}
