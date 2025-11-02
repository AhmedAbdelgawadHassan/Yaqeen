// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/shared/customText.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PrayCard extends StatefulWidget {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String cityName;

  const PrayCard({
    super.key,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    this.cityName = 'Cairo',
  });

  @override
  State<PrayCard> createState() => _PrayCardState();
}

class _PrayCardState extends State<PrayCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;   // controller for animation
  late Animation<Offset> _slideAnimation; // animation for slide
  late Animation<double> _fadeAnimation; // animation for fade

  @override
  void initState() {
    super.initState();
      // Animation code
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xffFDE7AA), // gold light
                Color(0xffD4AF37), // gold deep
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xff4A3B1D),),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(3, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mosque, color: Color(0xff4A3B1D)),
                  const SizedBox(width: 8),
                  Customtext(
                    text: 'مواقيت الصلاة - ${widget.cityName}',
                    fontSize: 20,
                    color: const Color(0xff4A3B1D),
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
              const Gap(30),

              // صف الصلوات الخمس
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPrayerItem(LucideIcons.sunrise, 'الفجر', widget.fajr), 
                  _buildPrayerItem(LucideIcons.sun, 'الظهر', widget.dhuhr),
                  _buildPrayerItem(LucideIcons.cloudSun, 'العصر', widget.asr),
                  _buildPrayerItem(LucideIcons.sunset, 'المغرب', widget.maghrib),
                  _buildPrayerItem(LucideIcons.moon, 'العشاء', widget.isha),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrayerItem(IconData icon, String name, String time) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xff4A3B1D), size: 28),
        const SizedBox(height: 6),
        Customtext(
          text: name,
          fontSize: 15,
          color: const Color(0xff4A3B1D),
          fontWeight: FontWeight.w900,
        ),
        Customtext(
          text: time,
          fontSize: 15,
          color: const Color(0xff4A3B1D),
        ),
      ],
    );
  }
}
