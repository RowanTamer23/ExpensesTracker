import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/chart/chart_bar.dart';
import 'package:flutter/material.dart';

class chart extends StatelessWidget {
  const chart({super.key, required this.expenses});

  final List<Expense> expenses;
  List<ExpensesBucket> get buckets {
    return [
      ExpensesBucket.forCategory(expenses, Category.food),
      ExpensesBucket.forCategory(expenses, Category.leisure),
      ExpensesBucket.forCategory(expenses, Category.travel),
      ExpensesBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;
    for (final bucket in buckets) {
      if (bucket.totalExpenses > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpenses;
      }
    }
    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors:
              isDarkMode
                  ? [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primaryContainer,
                  ]
                  : [
                    Theme.of(
                      context,
                    ).colorScheme.secondaryContainer.withOpacity(0.6),
                    Theme.of(context).colorScheme.primary.withOpacity(0.7),
                  ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets) // alternative to map()
                  ChartBar(
                    fill:
                        bucket.totalExpenses == 0
                            ? 0
                            : bucket.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children:
                buckets
                    .map(
                      (bucket) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            categoryIcon[bucket.category],
                            color:
                                isDarkMode
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
