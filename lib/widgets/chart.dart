import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/models/expence_model.dart';
import 'package:expenz/models/income_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  final Map<ExpenseCategory, double> expenseCategoryTotal;
  final Map<IncomeCategory, double> incomeCategoryTotal;
  final bool isExpense;

  const Chart(
      {super.key,
      required this.expenseCategoryTotal,
      required this.incomeCategoryTotal,
      required this.isExpense});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<PieChartSectionData> getCharts() {
    return widget.isExpense
        ? [
            PieChartSectionData(
              color: expenseCategoryColors[ExpenseCategory.food],
              value: widget.expenseCategoryTotal[ExpenseCategory.food],
              showTitle: false,
              radius: 60,
            ),
            PieChartSectionData(
              color: expenseCategoryColors[ExpenseCategory.health],
              value: widget.expenseCategoryTotal[ExpenseCategory.health],
              showTitle: false,
              radius: 60,
            ),
            PieChartSectionData(
              color: expenseCategoryColors[ExpenseCategory.shopping],
              value: widget.expenseCategoryTotal[ExpenseCategory.shopping],
              showTitle: false,
              radius: 60,
            ),
            PieChartSectionData(
              color: expenseCategoryColors[ExpenseCategory.subscription],
              value: widget.expenseCategoryTotal[ExpenseCategory.subscription],
              showTitle: false,
              radius: 60,
            ),
            PieChartSectionData(
              color: expenseCategoryColors[ExpenseCategory.transport],
              value: widget.expenseCategoryTotal[ExpenseCategory.transport],
              showTitle: false,
              radius: 60,
            ),
          ]
        : [
            PieChartSectionData(
              color: incomeCategoryColors[IncomeCategory.freelance],
              value: widget.incomeCategoryTotal[IncomeCategory.freelance],
              showTitle: false,
              radius: 60,
            ),
            PieChartSectionData(
              color: incomeCategoryColors[IncomeCategory.passive],
              value: widget.incomeCategoryTotal[IncomeCategory.passive],
              showTitle: false,
              radius: 60,
            ),
            PieChartSectionData(
              color: incomeCategoryColors[IncomeCategory.salary],
              value: widget.incomeCategoryTotal[IncomeCategory.salary],
              showTitle: false,
              radius: 60,
            ),
            PieChartSectionData(
              color: incomeCategoryColors[IncomeCategory.sales],
              value: widget.incomeCategoryTotal[IncomeCategory.sales],
              showTitle: false,
              radius: 60,
            ),
          ];
  }

  @override
  Widget build(BuildContext context) {
    final PieChartData pieChartData = PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 60,
        startDegreeOffset: -90,
        sections: getCharts(),
        borderData: FlBorderData(show: false));
    return Container(
      height: 300,
      width: 300,
      padding: const EdgeInsets.all(kDefalutPadding),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(180),
      ),
      child: Stack(
        children: [
          PieChart(
            pieChartData,
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "70%",
                  style: TextStyle(
                    color: kBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Of 100%",
                  style: TextStyle(
                    color: kBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
