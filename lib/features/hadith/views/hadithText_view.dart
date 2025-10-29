import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/shared/customText.dart';

class HadithtextView extends StatelessWidget {
  const HadithtextView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: AppColors.goldPrimaryColor,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage('assets/images/root/img_left_corner.png'),
                    width: 92,
                    height: 92,
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Customtext(text: 'الحديث الأول', fontSize: 20),
                  ),
                  Spacer(),
                  Image(
                    image: AssetImage(
                      'assets/images/root/img_right_corner (1).png',
                    ),
                    width: 92,
                    height: 92,
                  ),
                ],
              ),
              Gap(20),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Customtext(
                    text:
                        'عن أمـيـر المؤمنـين أبي حـفص عمر بن الخطاب رضي الله عنه ، قال : سمعت رسول الله صلى الله عـليه وسلم يـقـول : ( إنـما الأعـمـال بالنيات وإنـمـا لكـل امـرئ ما نـوى . فمن كـانت هجرته إلى الله ورسولـه فهجرتـه إلى الله ورسـوله ومن كانت هجرته لـدنيا يصـيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه ). رواه إمام المحد ثين أبـو عـبـد الله محمد بن إسماعـيل بن ابراهـيـم بن المغـيره بن بـرد زبه البخاري الجعـفي [رقم:1] وابـو الحسـيـن مسلم بن الحجاج بن مـسلم القـشـيري الـنيسـابـوري [رقم :1907] رضي الله عنهما في صحيحيهما اللذين هما أصح الكتب المصنفه.',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    maxLines: 1000,
                  ),
                ),
              ),
              Image(
                image: AssetImage(
                  'assets/images/root/img_bottom_decoration.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
