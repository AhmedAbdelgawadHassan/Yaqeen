// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:islami/features/time/data/morningAzkar_data.dart';

class MorningAzkarView extends StatefulWidget {
  const MorningAzkarView({super.key});

  @override
  State<MorningAzkarView> createState() => _MorningAzkarViewState();
}

class _MorningAzkarViewState extends State<MorningAzkarView> {
  List<Map<String, dynamic>> _morningAzkar = MorningazkarData.morningAzkar;

  void _decrementCount(int index) {
    setState(() {
      if (_morningAzkar[index]["count"] > 0) {
        _morningAzkar[index]["count"]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFDF7),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xffFDE7AA),
        title: const Text(
          "أذكار الصباح ",
          style: TextStyle(
            color: Color(0xff4A3B1D),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: _morningAzkar.length,
        itemBuilder: (context, index) {
          final  item = _morningAzkar[index];
          final bool isDone = item["count"] == 0;  // isDone = True if count = 0

          return GestureDetector(
            onTap: () => _decrementCount(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: isDone
                    ? const LinearGradient(
                        colors: [Color(0xffB6E5C9), Color(0xffDDFAD8)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : const LinearGradient(
                        colors: [Color(0xffFFF0C1), Color(0xffFFE59A)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(2, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Azkar text
                  Text(
                    item["text"],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.7,
                      fontWeight: FontWeight.w600,
                      color: isDone
                          ? Colors.black87
                          : const Color(0xff4A3B1D), // لون مريح للقراءة
                    ),
                  ),
                  const SizedBox(height: 16),
                  //Azkar count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xff4A3B1D),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          "التكرار: ${item["count"]}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //Azkar icon
                      AnimatedSwitcher(  // to Switch between icons
                        duration: const Duration(milliseconds: 300),
                        child: isDone
                            ? const Icon(Icons.check_circle,
                                color: Colors.green, size: 28)
                            : const Icon(Icons.touch_app,
                                color: Color(0xff836A3E), size: 26),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
