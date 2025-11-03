// ignore_for_file: deprecated_member_use

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

  Widget _buildWaveBar(int index) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final wave = sin((_controller.value * pi * 2) + (index * 0.6));
        final height = 10 + (wave.abs() * 30);
        return Container(
          width: 6,
          height: height,
          decoration: BoxDecoration(
            color: widget.isPlaying
                ? AppColors.goldPrimaryColor
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
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.isPlaying
              ? [
                  AppColors.goldPrimaryColor.withOpacity(0.95),
                  const Color(0xFFFFF3C0),
                ]
              : [
                  Colors.white,
                  AppColors.goldPrimaryColor.withOpacity(0.2),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: widget.isPlaying
              ? AppColors.goldPrimaryColor.withOpacity(0.8)
              : Colors.white70,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.isPlaying
                ? AppColors.goldPrimaryColor.withOpacity(0.4)
                : Colors.black12,
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(26),
        onTap: widget.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Gap(10),
            Customtext(
              text: widget.radioModel.radioName,
              color: widget.isPlaying ? Colors.black : Colors.black87,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            const Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
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
            const Gap(6),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: widget.isPlaying
                      ? [Colors.green.shade700, Colors.greenAccent.shade400]
                      : [Colors.black87, Colors.grey.shade700],
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.isPlaying
                        ? Colors.greenAccent.withOpacity(0.4)
                        : Colors.black12,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: IconButton(
                onPressed: widget.onPressed,
                iconSize: 55,
                icon: Icon(
                  widget.isPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            const Gap(8),
          ],
        ),
      ),
    );
  }
}
