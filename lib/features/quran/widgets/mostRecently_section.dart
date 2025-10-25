import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/features/quran/data/models/mostRecently_model.dart';
import 'package:islami/features/quran/widgets/mostRecently_card.dart';
import 'package:islami/shared/customText.dart';

class MostrecentlySection extends StatelessWidget {
  const MostrecentlySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(10),
        Padding(
          padding: EdgeInsets.only(left: 20,),
          child: Customtext(text: 'Most Recently', color: Colors.white)),
        Gap(10),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsetsGeometry.only(left: 15,),
                child: MostrecentlyCard(
                  mostrecentlyModel: MostrecentlyModel(
                    suraEnglishName: 'Al-Anbiya',
                    suraArabicName: 'الأنبياء',
                    versesNumber: 112,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
