import 'package:expenz/models/onboarding_model.dart';

class OnboardingData {
  static final List<OnboardingModel> onboardingDataList = [
    OnboardingModel(
      title: "Gain total control of your money", 
      imageUrl: "assets/images/onboard_1.png", 
      description: "Become your own money manager and make every cent count",
    ),
    OnboardingModel(
      title: "Know where your money goes", 
      imageUrl: "assets/images/onboard_2.png", 
      description: "Track your transaction easily, with catagories and financial report",
    ),
    OnboardingModel(
      title: "Planning ahead", 
      imageUrl: "assets/images/onboard_3.png", 
      description: "Setup your budget for each catagory so you in control",
    ),
  ];
}