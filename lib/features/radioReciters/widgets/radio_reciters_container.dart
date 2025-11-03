// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:islami/shared/customText.dart';

class RadioRecitersContainer extends StatelessWidget {
  const RadioRecitersContainer({
    super.key,
    required this.containerColor,
    required this.textColor,
    required this.text,
  });

  final Color containerColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 600),
      width: 165,
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            containerColor.withOpacity(0.9),
            containerColor.withOpacity(0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.7), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: containerColor.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(3, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.mic, color: Colors.white, size: 22),
          const SizedBox(width: 8),
          Customtext(
            text: text,
            fontSize: 18,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
