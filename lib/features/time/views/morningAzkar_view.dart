import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/time/data/morningAzkar_data.dart';

class MorningAzkarView extends StatefulWidget {
  const MorningAzkarView({super.key});

  @override
  State<MorningAzkarView> createState() => _MorningAzkarViewState();
}

class _MorningAzkarViewState extends State<MorningAzkarView> {
  List<Map<String, dynamic>> _morningAzkar = MorningazkarData.morningAzkar;//LIST OF MORNING AZKAR

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
      backgroundColor: AppColors.darkPrimaryColor, // Background color
      appBar: AppBar(
        backgroundColor: AppColors.goldPrimaryColor,
        elevation: 3,
        centerTitle: true,
        title: const Text(
          "أذكار الصباح",
          style: TextStyle(
            color: AppColors.darkPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: _morningAzkar.length,
        itemBuilder: (context, index) {
          final item = _morningAzkar[index];
          final bool isDone = item["count"] == 0;

          return GestureDetector(
            onTap: () => _decrementCount(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: isDone
                    ? const LinearGradient(
                        colors: [
                          Color(0xFF9BE7A6),
                          Color(0xFFD4F8C8),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : const LinearGradient(
                        colors: [
                          Color(0xFFFFE29F),
                          Color(0xFFFFC53E),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // نص الذكر
                  Text(
                    item["text"],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.8,
                      fontWeight: FontWeight.w600,
                      color: isDone
                          ? Colors.black87
                          : AppColors.darkPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // العداد والأيقونة
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.darkPrimaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          "التكرار: ${item["count"]}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: isDone
                            ? const Icon(Icons.check_circle,
                                color: Colors.green, size: 30, )
                            : const Icon(Icons.touch_app,
                                color: Colors.black87, size: 28,),
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
