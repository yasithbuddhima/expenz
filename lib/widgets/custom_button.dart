import 'package:expenz/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String buttonName;
  final Color buttonColor;
  const CustomButton({super.key, required this.buttonName, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Text(
          buttonName,
          style:const TextStyle(
            color: kWhite,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}