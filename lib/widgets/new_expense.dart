import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var _titleController = TextEditingController();
  var _amountController = TextEditingController();
  DateTime? selectedDate;
  Category _selectedCategory = Category.leisure;

  void _datepicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, 1, 1);

    var datePicked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: first,
      lastDate: now,
    );

    setState(() {
      selectedDate = datePicked;
    });
  }

  void submitExpense() {
    final enteredamount = double.tryParse(_amountController.text);
    final amounIsInvalid = enteredamount == null || enteredamount <= 0;
    if (amounIsInvalid ||
        _titleController.text.trim().isEmpty ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text(
                'Invalid Input',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              content: Text(
                'Please make sure you entered all the values correctly !',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text('Ok'),
                ),
              ],
            ),
      );
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        date: selectedDate!,
        amount: enteredamount!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        15,
        15,
        15,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(label: Text('Enter your Expense')),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    label: Text('Amount'),
                    prefix: Text('\$ '),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'no Date Selected'
                          : formatter.format(selectedDate!),
                    ),
                    IconButton(
                      onPressed: _datepicker,
                      icon: Icon(Icons.calendar_month_outlined),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items:
                    Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(
                              category.name.toUpperCase(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    _selectedCategory = value;
                  });
                },
              ),

              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('cancel'),
              ),
              ElevatedButton(onPressed: submitExpense, child: Text('submit')),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
