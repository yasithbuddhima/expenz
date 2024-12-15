import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:flutter/material.dart';

class AddNewScreen extends StatefulWidget {
  const AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  // State to track the expence or income
  int _selectedMethod = 0;

  ExpenseCategory _expenseCategory = ExpenseCategory.food;
  IncomeCategory _incomeCategory = IncomeCategory.salary;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefalutPadding),
            child: Stack(
              children: [
                // Expence Income tabs
                Padding(
                  padding: const EdgeInsets.all(kDefalutPadding),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 0;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: _selectedMethod == 0 ? kRed : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                              ),
                              child: Text(
                                "Expence",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        _selectedMethod == 0 ? kWhite : kBlack),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedMethod = 1;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                              color: _selectedMethod == 1 ? kGreen : kWhite,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 10,
                              ),
                              child: Text(
                                "Income",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        _selectedMethod == 1 ? kWhite : kBlack),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // How much field
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefalutPadding),
                  child: Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How Much?",
                          style: TextStyle(
                            color: kLightGrey.withOpacity(0.8),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextField(
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          style: TextStyle(
                            fontSize: 60,
                            color: kWhite,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            hintText: "0",
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: kWhite,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // user data form
                Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        children: [
                          // category selector drop down
                          DropdownButtonFormField(
                            items: _selectedMethod == 0
                                ? ExpenseCategory.values.map(
                                    (category) {
                                      return DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    },
                                  ).toList()
                                : IncomeCategory.values.map(
                                    (category) {
                                      return DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name),
                                      );
                                    },
                                  ).toList(),
                            value: _selectedMethod == 0
                                ? _expenseCategory
                                : _incomeCategory,
                            onChanged: (value) {
                              setState(() {
                                _selectedMethod == 0
                                    ? _expenseCategory =
                                        value as ExpenseCategory
                                    : _incomeCategory = value as IncomeCategory;
                              });
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: kDefalutPadding,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // Title feild
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintText: "Title",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: kDefalutPadding,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Description feild
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              hintText: "Description",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: kDefalutPadding,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Amount feild
                          TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Amount",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: kDefalutPadding,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
