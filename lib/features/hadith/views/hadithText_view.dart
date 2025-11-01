// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/shared/customText.dart';

class HadithtextView extends StatelessWidget {
  const HadithtextView({super.key, required this.hadithText});
  final String hadithText;
  

  @override
  Widget build(BuildContext context) {
    final String firstLine=hadithText.split('\n').first;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff0f2b24),
                Color(0xff091815),
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const Gap(60),
                // Hadith title
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/root/img_left_corner.png'),
                      width: 75,
                      height: 75,
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Customtext(
                        text: firstLine,   // display only the first line of all hadith (contains hadith Number)
                        fontSize: 22,
                        color: AppColors.goldPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const Image(
                      image: AssetImage('assets/images/root/img_right_corner (1).png'),
                      width: 75,
                      height: 75,
                    ),
                  ],
                ),

                const Gap(30),
               // Hadith text
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: AppColors.goldPrimaryColor.withOpacity(0.2),
                      ),
                    ),
                    child: Scrollbar(
                      thumbVisibility: true,
                      radius: const Radius.circular(20),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Customtext(
                          text:hadithText,
                          fontSize: 20,
                          color: Colors.white,
                          height: 1.9,
                          textAlign: TextAlign.justify,
                          fontWeight: FontWeight.w500,
                          maxLines: 1000,
                        ),
                      ),
                    ),
                  ),
                ),

                const Gap(20),

                Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    'assets/images/root/img_bottom_decoration.png',
                    width: 250,
                  ),
                ),

                const Gap(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
