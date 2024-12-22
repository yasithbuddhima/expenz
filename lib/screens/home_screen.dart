import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:expenz/services/user_services.dart';
import 'package:expenz/widgets/expense_card.dart';
import 'package:expenz/widgets/income_expence_card.dart';
import 'package:expenz/widgets/line_chart_sample.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Expense> expensesList;
  final List<Income> incomeList;
  const HomeScreen(
      {super.key, required this.expensesList, required this.incomeList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // For store the user name
  String userName = "";

  double expenseTotal = 0;
  double incomeTotal = 0;

  @override
  void initState() {
    // get the username from the shared pref.
    UserServices.getUserData().then((value) {
      if (value["userName"] != null) {
        setState(() {
          userName = value["userName"]!;
        });
      }
    });

    setState(() {
      for (var i = 0; i < widget.expensesList.length; i++) {
        expenseTotal += widget.expensesList[i].amount;
      }
      for (var i = 0; i < widget.incomeList.length; i++) {
        incomeTotal += widget.incomeList[i].amount;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // Main column
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: kMainColor.withOpacity(0.15),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(kDefalutPadding),
                  child: Column(
                    // Column with bg color
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kMainColor,
                              border: Border.all(color: kMainColor, width: 3),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/user.jpg",
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Hello $userName",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: kMainColor,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IncomeExpenceCard(
                            title: "Income",
                            amount: incomeTotal,
                            imageUrl: "assets/images/income.png",
                            bgColor: kGreen,
                          ),
                          IncomeExpenceCard(
                            title: "Expence",
                            amount: expenseTotal,
                            imageUrl: "assets/images/expense.png",
                            bgColor: kRed,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              // Line chart
              const Padding(
                padding: EdgeInsets.all(
                  kDefalutPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Spend Frequency",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: kBlack,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LineChartSample(),
                  ],
                ),
              ),

              // recent transactions
              Padding(
                padding: const EdgeInsets.all(kDefalutPadding),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Recent Transactions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: kBlack,
                          ),
                        ),
                        Container(
                          decoration:
                              BoxDecoration(color: kDefaultIconLightColor),
                          child: const Text(
                            "See All",
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                              return ExpenseCard(
                                title: expense.title,
                                description: expense.description,
                                date: expense.date,
                                time: expense.time,
                                category: expense.category,
                                amount: expense.amount,
                              );
                            },
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
