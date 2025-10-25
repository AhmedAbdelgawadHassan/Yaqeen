import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/features/quran/data/models/sura_model.dart';
import 'package:islami/features/quran/widgets/suraNumber_image.dart';
import 'package:islami/shared/customText.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key, required this.suraModel});
final SuraModel suraModel ;

  @override
  Widget build(BuildContext context) {
    return   Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.transparent
            ),
            child: 
           Column(
             children: [
               Row(
                children: [
                  SuranumberImage(suraNumber: suraModel.suraNumer,),
                  Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Customtext(text: suraModel.suraEnglishName,color: Colors.white,fontSize: 20,),
                    Gap(5),
                    Customtext(text:'${ suraModel.versesNumber.toString()} Verses',color: Colors.white,fontSize: 18,)
                  ],
                ),
                Spacer(),
                Customtext(text: suraModel.suraArabicName,color: Colors.white,fontSize: 20,),
                ],
               ),
               Gap(15),
               Divider(
                color: Colors.white,
                endIndent: 20,
                indent: 20,
               )
             ],
           ),
           
          );
  }
}