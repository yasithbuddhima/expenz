import 'package:expenz/constants/colors.dart';
import 'package:expenz/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IncomeCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime date;
  final DateTime time;
  final IncomeCategory category;
  final double amount;
  const IncomeCard(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.time,
      required this.category,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: kGrey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 1)),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: incomeCategoryColors[category]?.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              incomeCategoryImages[category]!,
              width: 20,
              height: 20,
              // fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              SizedBox(
                width: 150,
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: kGrey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "+\$${amount.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kGreen,
                ),
              ),
              Text(
                DateFormat.jm().format(date),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kGrey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
