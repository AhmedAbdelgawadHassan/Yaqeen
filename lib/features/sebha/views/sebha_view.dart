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
  List tasbeehList = SebhaData.tasbeehList;

  void incrementCount() => setState(() => count++);
  void resetCount() => setState(() => count = 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff091714),
                Color(0xff12332d),
                Color(0xff000000),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              // خلفية خفيفة شفافة
              Positioned(
                bottom: -10,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.15,
                  child: Image.asset(
                    'assets/images/root/img_bottom_decoration.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const LogoWidget(height: 90),
                      const Gap(25),

                      // حاوية التسبيح الجميلة (تذكر المستخدم بالنية)
                      const TasbeehConrainer(),
                      const Gap(25),

                      // Dropdown لاختيار التسبيحة
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.goldPrimaryColor.withOpacity(0.9),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.goldPrimaryColor
                                  .withOpacity(0.2),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedTasbeeh,
                            hint: const Center(
                              child: Text(
                                'اختر التسبيحة 🌸',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            isExpanded: true,
                            icon: const Icon(
                              Icons.expand_more_rounded,
                              color: AppColors.goldPrimaryColor,
                            ),
                            dropdownColor: AppColors.darkPrimaryColor,
                            borderRadius: BorderRadius.circular(15),
                            items: tasbeehList
                                .map(
                                  (tasbeeh) => DropdownMenuItem<String>(
                                    value: tasbeeh,
                                    child: Center(
                                      child: Text(
                                        tasbeeh,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
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

                      // عرض التسبيحة المختارة
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          key: ValueKey(selectedTasbeeh),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.goldPrimaryColor.withOpacity(0.95),
                                AppColors.goldPrimaryColor.withOpacity(0.75),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.goldPrimaryColor
                                    .withOpacity(0.4),
                                blurRadius: 18,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Text(
                            selectedTasbeeh ?? '🌿 اختر تسبيحة من القائمة 🌿',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkPrimaryColor,
                            ),
                          ),
                        ),
                      ),

                      const Gap(45),

                      // العداد
                      TesbeehCounterContainer(count: count.toString()),
                      const Gap(50),

                      // أزرار التحكم
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // زر التسبيح
                          GestureDetector(
                            onTap: incrementCount,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.goldPrimaryColor,
                                    AppColors.goldPrimaryColor
                                        .withOpacity(0.8),
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.goldPrimaryColor
                                        .withOpacity(0.4),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 36,
                              ),
                            ),
                          ),

                          const Gap(60),

                          // زر إعادة التصفير
                          GestureDetector(
                            onTap: resetCount,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.9),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.refresh_rounded,
                                color: AppColors.darkPrimaryColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
