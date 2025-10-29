import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/quran/data/models/mostRecently_model.dart';
import 'package:islami/shared/customText.dart';

class MostrecentlyCard extends StatelessWidget {
  const MostrecentlyCard({super.key, required this.mostrecentlyModel});
  final MostrecentlyModel mostrecentlyModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 130,
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
         color: AppColors.goldPrimaryColor,
         borderRadius: BorderRadius.circular(20),
         boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius:5,
          )
         ]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Customtext(text: mostrecentlyModel.suraEnglishName,fontSize: 22,color: Colors.black,),
             Gap(5),
             Customtext(text: mostrecentlyModel.suraArabicName,fontSize: 20,color: Colors.black,),
             Gap(5),
             Customtext(text:'${mostrecentlyModel.versesNumber.toString()}Verses',fontSize: 14,color: Colors.black,)
            ],
          ),
          Gap(5),
          Image(image: AssetImage('assets/images/root/img_most_recent.png'),height: 120,width: 140,)
        ],
      ),
    );
  }
}