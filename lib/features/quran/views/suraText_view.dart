import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/shared/customText.dart';

class SuratextView extends StatelessWidget {
  const SuratextView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back),color:AppColors.goldPrimaryColor,),
          title: Customtext(text: 'Al-Fatiha',fontSize: 20,),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(image: AssetImage('assets/images/root/img_left_corner.png'),width: 92,height: 92,),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Customtext(text: 'الفاتحه',fontSize: 20,)),
                  Spacer(),
                  Image(image: AssetImage('assets/images/root/img_right_corner (1).png'),width: 92,height: 92,)
                ],
              ),
              Gap(20),
              Customtext(text: '[1] بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ [2] الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ [3] الرَّحْمَنِ الرَّحِيمِ [4] مَالِكِ يَوْمِ الدِّينِ [5] إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ [6] اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ [7] صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين',
              maxLines:1200 ,
              fontSize: 20,
              height: 2,
              textAlign: TextAlign.center,
              wordSpacing: -0.5,
              fontWeight: FontWeight.bold,
              ),
              Spacer(),
              Image(image: AssetImage('assets/images/root/img_bottom_decoration.png'))
            ],
          ),
        ),
      ),
    );
  }
}