// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';
import 'package:islami/shared/customText.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.hadithModel, required this.hadithText});
  final HadithModel hadithModel;
    final String hadithText;



  @override
  Widget build(BuildContext context) {
    final String firstLine = hadithText.split('\n').first;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            const Color(0xff12332d).withOpacity(0.95),
            const Color(0xff0d1f1c).withOpacity(0.9),
            Colors.black.withOpacity(0.85),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(
          color: AppColors.goldPrimaryColor.withOpacity(0.7),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.goldPrimaryColor.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          // hadith number
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/root/img_left_corner.png'),
                width: 60,
              ),
              Expanded(
                child: Center(
                  child: Customtext(
                    text: firstLine,
                    fontSize: 15,
                    color: AppColors.goldPrimaryColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Image(
                image: AssetImage('assets/images/root/img_right_corner (1).png'),
                width: 60,
              ),
            ],
          ),
            // hadith text
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Customtext(
                  text: hadithModel.hadithText,
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.9,
                  maxLines: 150,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

        
        ],
      ),
    );
  }
}
