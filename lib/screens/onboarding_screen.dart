import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page_onboarding.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_page.dart';
import 'package:expenz/screens/user_data_screen.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Page Controller
  final _controller = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kDefalutPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Onboarding Screens
                  PageView(
                    controller: _controller,
                    onPageChanged: (index) {
                      setState(() {
                        showDetailsPage = index == 3;
                      });
                    },
                    children: [
                      const FrontPageOnboarding(),
                      SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[0].title,
                        description:
                            OnboardingData.onboardingDataList[0].description,
                        imageUrl: OnboardingData.onboardingDataList[0].imageUrl,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[1].title,
                        description:
                            OnboardingData.onboardingDataList[1].description,
                        imageUrl: OnboardingData.onboardingDataList[1].imageUrl,
                      ),
                      SharedOnboardingScreen(
                        title: OnboardingData.onboardingDataList[2].title,
                        description:
                            OnboardingData.onboardingDataList[2].description,
                        imageUrl: OnboardingData.onboardingDataList[2].imageUrl,
                      ),
                    ],
                  ),

                  // Page dot Indicator
                  Container(
                    alignment: const Alignment(0, 0.75),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: const WormEffect(
                          activeDotColor: kMainColor, dotColor: kLightGrey),
                    ),
                  ),

                  // Navigator button
                  Positioned(
                      bottom: 20,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: !showDetailsPage
                            ? GestureDetector(
                                onTap: () {
                                  _controller.animateToPage(
                                      _controller.page!.toInt() + 1,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut);
                                },
                                child: CustomButton(
                                  buttonName:
                                      showDetailsPage ? "Get Started" : "Next",
                                  buttonColor: kMainColor,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const UserDataScreen(),
                                      ));
                                },
                                child: CustomButton(
                                  buttonName:
                                      showDetailsPage ? "Get Started" : "Next",
                                  buttonColor: kMainColor,
                                ),
                              ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
