import 'package:expenz/constants/colors.dart';
import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/screens/add_new_screen.dart';
import 'package:expenz/screens/budgets_screen.dart';
import 'package:expenz/screens/home_screen.dart';
import 'package:expenz/screens/profile_screen.dart';
import 'package:expenz/screens/transaction_screen.dart';
import 'package:expenz/services/expense_service.dart';
import 'package:expenz/services/income_service.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // current page index
  int _currentPageIndex = 1;

  List<Expense> expenseList = [];
  List<Income> incomeList = [];

  // Function to feth expenses
  void fetchAllExpenses() async {
    List<Expense> loadedExpenses = await ExpenceService.loadExpenses();
    setState(() {
      expenseList = loadedExpenses;
    });
  }

  // Function to feth incomes
  void fetchAllIncomes() async {
    List<Income> loadedIncomes = await IncomeServices.loadIncomes();
    setState(() {
      incomeList = loadedIncomes;
    });
  }

  @override
  void initState() {
    setState(() {
      fetchAllExpenses();
      fetchAllIncomes();
    });
    super.initState();
  }

  // Funtion to add a new expense
  void addNewExpense(Expense newExpence) {
    ExpenceService.saveExpense(newExpence, context);
    setState(() {
      expenseList.add(newExpence);
    });
  }

  // Funtion to add a new income
  void addNewIncome(Income newIncome) {
    IncomeServices.saveIncome(newIncome, context);
    setState(() {
      incomeList.add(newIncome);
    });
  }

  // Function to remove expense
  void removeExpense(Expense expense) async {
    ExpenceService.deleteExpense(expense.id, context);
    setState(() {
      expenseList.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      TransactionScreen(
        expensesList: expenseList,
        onDismissedExpense: removeExpense,
      ),
      AddNewScreen(
        addExpense: addNewExpense,
        addIncome: addNewIncome,
      ),
      const BudgetsScreen(),
      const ProfileScreen()
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: kMainColor, shape: BoxShape.circle),
              child: const Icon(
                Icons.add,
                color: kWhite,
                size: 30,
              ),
            ),
            label: "",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "Budget",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: pages[_currentPageIndex],
    );
  }
}
