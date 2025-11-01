import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/hadith/views/hadith_view.dart';
import 'package:islami/features/quran/views/quran_view.dart';
import 'package:islami/features/radio/views/radio_view.dart';
import 'package:islami/features/sebha/views/sebha_view.dart';
import 'package:islami/features/time/views/time_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  final PageController controller = PageController();
  int currentPage = 0;

  final List<Widget> views = [
    const QuranView(),
    const HadithView(),
    const SebhaView(),
    const RadioView(),
    const TimeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          onPageChanged: (index) => setState(() => currentPage = index),
          children: views,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.goldPrimaryColor.withOpacity(0.9),
                Colors.amber.shade600,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              currentIndex: currentPage,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black87,
              selectedIconTheme: const IconThemeData(size: 28),
              unselectedIconTheme: const IconThemeData(size: 22),
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: (index) {
                setState(() => currentPage = index);
                controller.jumpToPage(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bookQuran),
                  label: 'Quran',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.bookOpen),
                  label: 'Hadith',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.infinity),
                  label: 'Sebha',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.radio),
                  label: 'Radio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.solidClock),
                  label: 'Time',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
