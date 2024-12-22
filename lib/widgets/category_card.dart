import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String title;
  final double amount;
  final double total;
  final Color progressColor;
  final bool isExpense;
  const CategoryCard(
      {super.key,
      required this.title,
      required this.amount,
      required this.total,
      required this.progressColor,
      required this.isExpense});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    double progressWidth = widget.total != 0
        ? MediaQuery.of(context).size.width * (widget.amount / widget.total)
        : 0;

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(kDefalutPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kWhite,
        boxShadow: [
          BoxShadow(
            color: kBlack.withOpacity(0.1),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: widget.progressColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          color: kBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${(widget.amount / widget.total * 100).toStringAsFixed(2)} %",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kBlack,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                "${widget.amount.toStringAsFixed(2)} \$",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: widget.isExpense ? kRed : kGreen,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 10,
            width: progressWidth,
            decoration: BoxDecoration(
                color: widget.progressColor,
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
