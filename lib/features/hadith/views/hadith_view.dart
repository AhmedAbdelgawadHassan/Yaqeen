// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';
import 'package:islami/features/hadith/views/hadithText_view.dart';
import 'package:islami/features/hadith/widgets/hadith_item.dart';
import 'package:islami/shared/logo_widget.dart';

class HadithView extends StatefulWidget {
  const HadithView({super.key});

  @override
  State<HadithView> createState() => _HadithViewState();
}

class _HadithViewState extends State<HadithView> {
  final ScrollController _scrollController = ScrollController();
  Timer? timer;


    @override
  void initState() {
    super.initState();

    // تشغيل التمرير التلقائي
    timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        double delta = 3.0;  // السرعه 
        double nextScroll = currentScroll + delta;
        if (nextScroll >= maxScroll) {
          _scrollController.jumpTo(0); // لما يوصل للنهاية يرجع للبداية
        } else {
          _scrollController.jumpTo(nextScroll);
        }
      }
    });
  }
   @override
  void dispose() {
    timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            body: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/root/hadithbackground.png'))
              ),
              child: Column(
                children: [
                  LogoWidget(),
                  Gap(30),
                SizedBox(
                  height:MediaQuery.of(context).size.height * 0.63 ,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                    return  InkWell(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => HadithtextView(),));

                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: HadithItem(
                        hadithModel: HadithModel(
                           hadithNumber: "الحديث الأول",
                          hadithText: 'عن أمـيـر المؤمنـين أبي حـفص عمر بن الخطاب رضي الله عنه ، قال : سمعت رسول الله صلى الله عـليه وسلم يـقـول : ( إنـما الأعـمـال بالنيات وإنـمـا لكـل امـرئ ما نـوى . فمن كـانت هجرته إلى الله ورسولـه فهجرتـه إلى الله ورسـوله ومن كانت هجرته لـدنيا يصـيبها أو امرأة ينكحها فهجرته إلى ما هاجر إليه ). رواه إمام المحد ثين أبـو عـبـد الله محمد بن إسماعـيل بن ابراهـيـم بن المغـيره بن بـرد زبه البخاري الجعـفي [رقم:1] وابـو الحسـيـن مسلم بن الحجاج بن مـسلم القـشـيري الـنيسـابـوري [رقم :1907] رضي الله عنهما في صحيحيهما اللذين هما أصح الكتب المصنفه.'),
                         ),
                      ),
                    ) ;
                  },),
                )
                ],
              ),
            ),
      ),
    );
  }
}