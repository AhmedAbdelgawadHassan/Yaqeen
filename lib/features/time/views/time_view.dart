import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/features/time/widgets/azkar_section.dart';
import 'package:islami/features/time/widgets/prayers_time.dart';
import 'package:islami/shared/logo_widget.dart';

class TimeView extends StatelessWidget {
  const TimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                LogoWidget(height: 100),
                PrayersTime(),
                Gap(10),
                AzkarSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
