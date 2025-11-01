// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/sebha/data/sebha_data.dart';
import 'package:islami/features/sebha/widgets/tasbeeh_conrainer.dart';
import 'package:islami/features/sebha/widgets/tesbeeh_counter_container.dart';
import 'package:islami/shared/logo_widget.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  String? selectedTasbeeh;
  int count = 0;
  List tasbeehList = SebhaData.tasbeehList;   // list of tasbeeh (stored in tasbeeh_data.dart)

  void incrementCount() {
    setState(() => count++);
  }

  void resetCount() {
    setState(() => count = 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(  // LinearGradient for background
              colors: [
                Color(0xff0d1f1c),
                Color(0xff12332d),
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              // Background image
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    'assets/images/root/img_bottom_decoration.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const LogoWidget(height: 100),
                    const Gap(20),
                    TasbeehConrainer(),
                    const Gap(30),

                    // Dropdown Menu
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.goldPrimaryColor.withOpacity(0.8),
                        ),
                      ),
                      child: DropdownButtonHideUnderline(  
                        child: DropdownButton<String>(
                          value: selectedTasbeeh,
                          hint: const Center(
                            child: Text(
                              'اختر التسبيحة',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down_rounded,
                              color: AppColors.goldPrimaryColor),
                          dropdownColor: AppColors.darkPrimaryColor,
                          items: tasbeehList         // the list of tasbeeh that will displayed in dropdown
                              .map(
                                (tasbeeh) => DropdownMenuItem<String>(
                                  value: tasbeeh,
                                  child: Text(
                                    tasbeeh,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedTasbeeh = value;
                              count = 0;
                            });
                          },
                        ),
                      ),
                    ),

                    const Gap(40),

                    // Display Selected Tasbeeh
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.goldPrimaryColor.withOpacity(0.9),
                            AppColors.goldPrimaryColor.withOpacity(0.7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.goldPrimaryColor.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Text(
                        selectedTasbeeh ?? 'اختر تسبيحة من القائمة',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkPrimaryColor,
                        ),
                      ),
                    ),

                    const Gap(50),
                    // Counter Box
                  TesbeehCounterContainer(
                    count: count.toString(),
                  ),
                    const Gap(40),

                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Increment
                        ElevatedButton(
                          onPressed: incrementCount,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.goldPrimaryColor,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(25),
                            elevation: 8,
                          ),
                          child:
                              const Icon(Icons.add, color: Colors.black, size: 36),
                        ),

                        const Gap(60),

                        // Reset
                        ElevatedButton(
                          onPressed: resetCount,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(25),
                            elevation: 8,
                          ),
                          child: const Icon(Icons.refresh,
                              color: AppColors.darkPrimaryColor, size: 32),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
