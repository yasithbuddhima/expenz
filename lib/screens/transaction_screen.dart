import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/widgets/expense_card.dart';
import 'package:expenz/widgets/income_card.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  final List<Expense> expensesList;
  final void Function(Expense) onDismissedExpense;
  final List<Income> incomesList;
  final void Function(Income) onDismissedIncome;
  const TransactionScreen({
    super.key,
    required this.expensesList,
    required this.onDismissedExpense,
    required this.incomesList,
    required this.onDismissedIncome,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefalutPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "See your financial Report",
                  style: TextStyle(
                    color: kMainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Expenses",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Show all the expenses
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.expensesList.isEmpty
                            ? Text(
                                "No Expenses added yet. Add expenses to see here",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kGrey,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.expensesList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Expense expense = widget.expensesList[index];
                                  return Dismissible(
                                    key: ValueKey(expense),
                                    direction: DismissDirection.startToEnd,
                                    onDismissed: (direction) {
                                      setState(() {
                                        widget.onDismissedExpense(expense);
                                      });
                                    },
                                    child: ExpenseCard(
                                      title: expense.title,
                                      description: expense.description,
                                      date: expense.date,
                                      time: expense.time,
                                      category: expense.category,
                                      amount: expense.amount,
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Incomes",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Show all the Incomes
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        widget.expensesList.isEmpty
                            ? Text(
                                "No Incomes added yet. Add incomes to see here",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kGrey,
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.incomesList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Income income = widget.incomesList[index];
                                  return Dismissible(
                                    key: ValueKey(income),
                                    direction: DismissDirection.startToEnd,
                                    onDismissed: (direction) {
                                      setState(() {
                                        widget.onDismissedIncome(income);
                                      });
                                    },
                                    child: IncomeCard(
                                      title: income.title,
                                      description: income.description,
                                      date: income.date,
                                      time: income.time,
                                      category: income.category,
                                      amount: income.amount,
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
