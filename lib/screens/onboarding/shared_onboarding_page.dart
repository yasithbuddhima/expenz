import 'package:expenz/constants/colors.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  const SharedOnboardingScreen(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: MediaQuery.of(context).size.width * 0.4,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 28, fontWeight: FontWeight.w500, color: kMainColor),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: kGrey, fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
