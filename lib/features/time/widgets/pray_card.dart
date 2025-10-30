import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/shared/customText.dart';

class PrayCard extends StatelessWidget {
  const PrayCard({super.key, required this.time, required this.name, });
  final String time;
  final String name;


  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 105,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [AppColors.darkPrimaryColor, AppColors.goldPrimaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Customtext(text: name,fontSize: 18,color: Colors.white,fontWeight: FontWeight.w700,),
            Gap(5),
            Customtext(text: time,fontSize: 32,color: Colors.white,),
            Gap(5),
            Customtext(text: 'PM',fontSize: 16,color: Colors.white,),
          ],
        ),
    );
  }
}
