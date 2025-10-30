import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/time/data/models/pray_model.dart';
import 'package:islami/features/time/widgets/pray_card.dart';
import 'package:islami/shared/customText.dart';

class PrayersTime extends StatefulWidget {
  const PrayersTime({super.key, required this.prayModel});
  final PrayModel prayModel;

  @override
  State<PrayersTime> createState() => _PrayersTimeState();
}

class _PrayersTimeState extends State<PrayersTime> {
   final ScrollController _scrollController = ScrollController();
  Timer? timer;


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
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xff836A3E),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: 300,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: AppColors.goldPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1300),
                topRight: Radius.circular(1300),
              ),
            ),
            child: Column(
              children: [
                Customtext(
                  text: 'Prayers Time',
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                Gap(10),
                Customtext(
                  text: widget.prayModel.day,
                  fontSize: 18,
                  color: Colors.black,
                ),
                Gap(75),
              SizedBox(
                height: 145,
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10
                    ),
                    child: PrayCard(name: widget.prayModel.name, time: widget.prayModel.time));
                },),
              )
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Column(
            children: [
              Customtext(
                text: widget.prayModel.birthDatel,
                fontSize: 16,
                color: Colors.white,
              ),
              Customtext(text: '2025', fontSize: 16, color: Colors.white),
              
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Column(
            children: [
              Customtext(
                text: widget.prayModel.hijriDate,
                fontSize: 16,
                color: Colors.white,
              ),
              Gap(5),
              Customtext(text: '1447', fontSize: 16, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }
}
