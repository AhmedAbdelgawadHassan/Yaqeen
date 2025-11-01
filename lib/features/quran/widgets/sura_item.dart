// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/features/quran/data/models/sura_model.dart';
import 'package:islami/shared/customText.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.suraModel});
  final SuraModel suraModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.teal.withOpacity(0.25),
            Colors.black.withOpacity(0.4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white24, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Sura number
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.amber.shade300, Colors.deepOrange.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Customtext(
              text: suraModel.suraIndex,
              color: Colors.black,
              fontSize: 20,
            ),
          ),

          const Gap(20),

          // Sura name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customtext(
                  text: suraModel.suraNameEn,
                  color: Colors.white,
                  fontSize: 18,
                ),
                const Gap(4),
                Customtext(
                  text: '${suraModel.versesNum} Verses',
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ],
            ),
          ),

         //Sura Arabic name
          Customtext(
            text: suraModel.suraNameAr,
            color: Colors.amber.shade200,
            fontSize: 22,
          ),
        ],
      ),
    );
  }
}
