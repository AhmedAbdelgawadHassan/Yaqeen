import 'package:flutter/material.dart';
import 'package:islami/features/time/data/eveningAzkar_data.dart';

class EveningAzkarView extends StatefulWidget {
  const EveningAzkarView({super.key});

  @override
  State<EveningAzkarView> createState() => _EveningAzkarViewState();
}

class _EveningAzkarViewState extends State<EveningAzkarView> {
  final List<Map<String, dynamic>> _eveningAzkar = EveningazkarData.morningAzkar;

  void _decrementCount(int index) {
    setState(() {
      if (_eveningAzkar[index]["count"] > 0) {
        _eveningAzkar[index]["count"]--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFAF6EE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF1E3C6),
        centerTitle: true,
        title: const Text(
          "أذكار المساء ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff4A3B1D),
            fontSize: 22,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: _eveningAzkar.length,
        itemBuilder: (context, index) {
          final item = _eveningAzkar[index];
          final isDone = item["count"] == 0;

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
                        colors: [Color(0xffB2E3B6), Color(0xffD6F6D1)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : const LinearGradient(
                        colors: [Color(0xffF9E8B1), Color(0xffF7D77A)],
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
                      color: isDone ? Colors.black87 : const Color(0xff4A3B1D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Azkar count
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
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isDone
                            ? const Icon(Icons.check_circle,
                                color: Colors.green, size: 28)
                            : const Icon(Icons.touch_app,
                                color: Color(0xff836A3E), size: 26),
                      )
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
