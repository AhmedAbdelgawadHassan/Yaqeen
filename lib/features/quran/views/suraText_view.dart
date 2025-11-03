// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/shared/customText.dart';

class SuratextView extends StatelessWidget {
  const SuratextView({
    super.key,
    required this.suraNameEn,
    required this.suraNameAr,
    required this.suraText,
    required this.suraIndex,
  });

  final String suraNameEn;
  final String suraNameAr;
  final String suraText;
  final String suraIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xff0d1f1c),
                const Color(0xff12332d),
                Colors.black.withOpacity(0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    'assets/images/root/img_bottom_decoration.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: AppColors.goldPrimaryColor.withOpacity(0.7),
                          width: 1.4,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                image: AssetImage(
                                  'assets/images/root/img_left_corner.png',
                                ),
                                width: 70,
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Customtext(
                                    text: suraNameAr,
                                    fontSize: 26,
                                    color: AppColors.goldPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const Gap(5),
                                  Container(
                                    width: 80,
                                    height: 2,
                                    color: AppColors.goldPrimaryColor
                                        .withOpacity(0.8),
                                  ),
                                  const Gap(5),
                                  Customtext(
                                    text: suraNameEn,
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              Spacer(),
                              const Image(
                                image: AssetImage(
                                  'assets/images/root/img_right_corner (1).png',
                                ),
                                width: 70,
                              ),
                            ],
                          ),
                          const Gap(20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Customtext(    //سورة التوبة مش بتبدا ببسم الله الرحمن الرحيم 
                              text: suraIndex == '9'    // index بتاع سورة التوبة 
                                  ? suraText
                                  : "         بسم الله الرحمن الرحيم\n$suraText", // عشان كل السور تبدا ببسم الله الرحمن الرحيم
                              maxLines: 2000,
                              fontSize: 22,
                              height: 2.2,
                              color: Colors.white,
                              textAlign: TextAlign.justify,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
