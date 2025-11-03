import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/onboarding/views/splash_view.dart';


void main() async {

  runApp(const Islami());

}



class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkPrimaryColor,
      ),
    );
  }
}