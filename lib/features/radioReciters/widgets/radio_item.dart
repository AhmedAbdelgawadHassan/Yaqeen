import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/radioReciters/data/models/radio_model.dart';
import 'package:islami/shared/customText.dart';

class RadioItem extends StatefulWidget {
  const RadioItem({
    super.key,
    required this.radioModel,
    required this.onPressed,
    required this.isPlaying,
  });

  final RadioModel radioModel;
  final VoidCallback onPressed;
  final bool isPlaying;

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // build wave bar
  Widget _buildWaveBar(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final wave = sin((_controller.value * pi * 2) + (index * 0.6));
        final height = 10 + (wave.abs() * 30); // ارتفاع الموجة
        return Container(
          width: 8,
          height: height,
          decoration: BoxDecoration(
            color: widget.isPlaying
                ? AppColors.darkPrimaryColor
                : Colors.grey.shade400,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 00),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.isPlaying
              ? [
                  AppColors.goldPrimaryColor.withOpacity(0.9),
                  Colors.amber.shade200,
                ]
              : [
                  Colors.white.withOpacity(0.95),
                  AppColors.goldPrimaryColor.withOpacity(0.7),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(20),
            Customtext(
              text: widget.radioModel.radioName,
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            // موجات الصوت بعرض الكونتينر كله
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(20, (i) {
                    return _buildWaveBar(i);
                  }),
                ),
              ),
            ),
            IconButton(
              onPressed: widget.onPressed,
              iconSize: 55,
              icon: Icon(
                widget.isPlaying
                    ? Icons.pause_circle_filled_rounded
                    : Icons.play_circle_fill_rounded,
                color: widget.isPlaying
                    ? Colors.green.shade700
                    : Colors.black.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
