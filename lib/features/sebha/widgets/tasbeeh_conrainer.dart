import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';

class TasbeehConrainer extends StatelessWidget {
  const TasbeehConrainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.goldPrimaryColor,
                          width: 1.5,
                        ),
                      ),
                      child: const Text(
                        '🌙 سَبِّحْ بِاسْمِ رَبِّكَ الْأَعْلَى 🌙',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    );
  }
}