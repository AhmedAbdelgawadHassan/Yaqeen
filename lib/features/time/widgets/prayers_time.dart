// ignore_for_file: deprecated_member_use
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/core/services/prayerTime_service/prayerTime_service.dart';
import 'package:islami/features/time/data/models/prayer_model.dart';
import 'package:islami/features/time/widgets/pray_card.dart';
import 'package:islami/shared/customText.dart';

class PrayersTime extends StatefulWidget {
  const PrayersTime({super.key});

  @override
  State<PrayersTime> createState() => _PrayersTimeState();
}

class _PrayersTimeState extends State<PrayersTime> {
  late Future<PrayerModel> _futurePrayers;  // Wiil be initialized in InitState

  @override
  void initState() {
    super.initState();
    _futurePrayers = PrayertimeService(dio: Dio()).getPrayersTime();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PrayerModel>(
      future: _futurePrayers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {  //if data is loading
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {     //if there is an error
          return const Center(
            child: Text(
              'حدث خطأ أثناء جلب مواعيد الصلاة ⚠️',
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data == null) {  //if there is no data
          // لو مفيش بيانات
          return const Center(child: Text('لا توجد بيانات حالياً'));
        }

        final prayerModel = snapshot.data!;
       // if there is data display UI correctly
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [
                Color(0xffD4AF37), // Gold
                Color(0xff836A3E), // Brown-gold
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 4)),
            ],
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.goldPrimaryColor.withOpacity(0.9),
                      const Color(0xff836A3E).withOpacity(0.9),
                    ],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Customtext(
                      text: 'Prayer Times',
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    const Gap(10),
                    Customtext(
                      text: prayerModel.weekday,
                      fontSize: 25,
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.w800,
                      
                    ),
                    const Gap(10),
                    Customtext(
                      text: prayerModel.gregorianDate,
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    const Gap(10),
                     // Hijri Date (merge 3 texts for Day&Month&Year)
                    Customtext(
                      text: '${prayerModel.hijriDay} ${prayerModel.hijriMonth} ${prayerModel.hijriYear}',
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    const Gap(25),
                  // container for Prayers Times
                    PrayCard(
                      fajr: prayerModel.fajr,
                      dhuhr: prayerModel.dhuhr,
                      asr: prayerModel.asr,
                      maghrib: prayerModel.maghrib,
                      isha: prayerModel.ishaa,
                      cityName: 'Cairo',  // doesn't coming from API
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
