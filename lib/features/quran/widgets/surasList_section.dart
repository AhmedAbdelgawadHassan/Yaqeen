import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/features/quran/data/models/sura_model.dart';
import 'package:islami/features/quran/widgets/sura_item.dart';
import 'package:islami/shared/customText.dart';

class SuraslistSection extends StatelessWidget {
  const SuraslistSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20),
        Padding(
          padding:EdgeInsets.only(left: 20) ,
          child: Customtext(text: 'Suras List',color: Colors.white,)),
          Gap(20),
         Expanded(
           child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
             return  Padding(
              padding: EdgeInsets.only(bottom: 10),
               child: SuraItem(
                suraModel: SuraModel(
                  suraEnglishName: 'Al-Fatiha',
                   suraArabicName: 'الفاتحه',
                    versesNumber: 122,
                     suraNumer: 1),
                           ),
             );
           },),
         )
      ],
    );
  }
}