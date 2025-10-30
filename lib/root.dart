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
    QuranView(),  //finished
    HadithView(), // finished
    SebhaView(),  // finished
    RadioView(),  // finished
    TimeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: views,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.goldPrimaryColor,
        iconSize: 25,
        selectedIconTheme: IconThemeData(size: 30),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        
      elevation: 0,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
          controller.jumpToPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bookQuran), label: 'Quran'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.bookOpen), label: 'Hadith'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.infinity), label: 'Sebha'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.radio), label: 'Radio'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidClock), label: 'Time'),

        ],
      ),
    );
  }
}
