import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/shared/logo_widget.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  String? selectedTasbeeh;
  int count = 0;

  final List<String> tasbeehList = [
    'سُبْحَانَ اللهِ',
    'الْحَمْدُ لِلَّهِ',
    'اللهُ أَكْبَرُ',
    'لَا إِلٰهَ إِلَّا اللهُ',
    'أَسْتَغْفِرُ اللهَ',
    'سُبْحَانَ اللهِ وَبِحَمْدِهِ',
    'سُبْحَانَ اللهِ الْعَظِيمِ',
    'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ',
    'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ',
    'اللَّهُمَّ اغْفِرْ لِي',
    'اللَّهُمَّ ارْحَمْنِي',
    'اللَّهُمَّ ارْزُقْنِي',
    'اللَّهُمَّ اجْعَلْنِي مِنَ التَّوَّابِينَ',
    'اللَّهُمَّ تَقَبَّلْ مِنَّا إِنَّكَ أَنْتَ السَّمِيعُ الْعَلِيمُ',
    'اللَّهُمَّ أَعْتِقْ رِقَابَنَا مِنَ النَّارِ',
    'اللَّهُمَّ إِنِّي ظَلَمْتُ نَفْسِي فَاغْفِرْ لِي',
    'اللَّهُمَّ اشْفِ مَرْضَانَا وَمَرْضَى الْمُسْلِمِينَ',
    'اللَّهُمَّ ثَبِّتْ قَلْبِي عَلَى دِينِكَ',
    'اللَّهُمَّ اهْدِنِي لِأَحْسَنِ الْأَخْلَاقِ',
    'اللَّهُمَّ اجْعَلْ هَذَا الْيَوْمَ خَيْرًا لِي',
    'اللَّهُمَّ اجْعَلِ الْقُرْآنَ رَبِيعَ قَلْبِي',
    'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ',
    'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْكَسَلِ وَالْجُبْنِ',
    'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    'اللَّهُمَّ اجْعَلْنَا مِنَ الذَّاكِرِينَ الشَّاكِرِينَ',
  ];

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
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LogoWidget(),
              const Gap(10),
              // Dropdown
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedTasbeeh,
                    hint: const Center(
                      child: Text(
                        'اختر التسبيحة',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ),
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
                    dropdownColor: Colors.white,
                    items: tasbeehList
                        .map(
                          (tasbeeh) => DropdownMenuItem<String>(
                            value: tasbeeh,
                            child: Text(
                              tasbeeh,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black87,
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
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.goldPrimaryColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                      
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
              Container(
                width: 110,
                height: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  '$count',
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const Gap(30),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Increment
                  ElevatedButton(
                    onPressed: incrementCount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:AppColors.goldPrimaryColor,
                      padding: const EdgeInsets.all(20),
                      elevation: 6,
                    ),
                    child: const Icon(Icons.add, color: Colors.black, size: 32),
                  ),

                  const Gap(40),

                  // Reset
                  ElevatedButton(
                    onPressed: resetCount,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
                      elevation: 6,
                    ),
                    child: const Icon(Icons.refresh, color: Colors.black, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
