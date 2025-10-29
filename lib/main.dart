import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/onboarding/views/onboardingRoot.dart';

void main()
{
  runApp(Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingRoot(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkPrimaryColor,
      ),
    );
  }
}