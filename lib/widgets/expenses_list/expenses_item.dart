import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
            Row(
              children: [
                Text(
                  expense.amount.toStringAsFixed(2),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcon[expense.category]),
                    SizedBox(width: 8),
                    Text(
                      expense.formattedDate,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
