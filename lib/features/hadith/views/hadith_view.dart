// ignore_for_file: unused_field, deprecated_member_use

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
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
  final ScrollController _scrollController = ScrollController(); // for automatic scroll
  Timer? timer;
  List<HadithModel> hadithList = [];



  Future<void> loadHadiths() async {   // method to load hadiths
    List<HadithModel> tempList = [];

    for (int i = 1; i <= 50; i++) { // عدّل الرقم حسب عدد الملفات اللي عندك
      try {
        String text = await rootBundle.loadString('assets/files/hadith/h$i.txt');
        tempList.add(HadithModel(hadithNumber: "الحديث $i", hadithText: text));
      } catch (e) {
        debugPrint("Error loading hadith $i: $e");
      }
    }

    setState(() {
      hadithList = tempList;
    });

    // بعد التحميل، نشغّل الـ auto scroll
    startAutoScroll();
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;
        const delta = 2.5;
        final nextScroll = currentScroll + delta;
        if (nextScroll >= maxScroll) {
          _scrollController.jumpTo(0);
        } else {
          _scrollController.jumpTo(nextScroll);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
        loadHadiths(); 

    // animation for automatic scroll
    timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      if (_scrollController.hasClients) {
        final maxScroll = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.offset;
        const delta = 2.5; // السرعة
        final nextScroll = currentScroll + delta;
        if (nextScroll >= maxScroll) {
          _scrollController.jumpTo(0);
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
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
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
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    'assets/images/root/img_bottom_decoration.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                children: [
                  const Gap(20),
                  const LogoWidget(
                    height: 100
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8,),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.goldPrimaryColor.withOpacity(0.6),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.goldPrimaryColor.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          "✦ أحاديث نبوية ✦",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(30),
                  // list of hadith
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: hadithList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  HadithtextView(
                                  hadithText: hadithList[index].hadithText,
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.06),
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: HadithItem(
                                hadithModel:hadithList[index],
                                hadithText: hadithList[index].hadithText,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
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
