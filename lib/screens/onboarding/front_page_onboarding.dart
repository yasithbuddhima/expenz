import 'package:expenz/constants/colors.dart';
import 'package:flutter/material.dart';

class FrontPageOnboarding extends StatelessWidget {
  const FrontPageOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: MediaQuery.of(context).size.width * 0.4,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20,),
        const Text(
          "Expenz",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color:kMainColor
          ),
        )
      ],
    );
  }
}