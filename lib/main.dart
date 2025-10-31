import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/onboarding/views/onboardingRoot.dart';

void main()
 {
  runApp(Islami(),);



  //code for Testing API
// final dio = Dio();
  // final service = RadioService(dio: dio);
  // try {     // 
  //   final radios = await service.getRadio();
  //   print(' عدد الإذاعات: ${radios.length}');
  //   print(' أول إذاعة: ${radios.first.radioName}');
  //   print(radios.first.radioSoundUrl);
  // } catch (e) {
  //   print(' حصل خطأ: $e');
  // }

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