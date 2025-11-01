import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';

class TesbeehCounterContainer extends StatelessWidget {
  const TesbeehCounterContainer({super.key, required this.count});
  final String count;

  @override
  Widget build(BuildContext context) {
    return   Container(
                      width: 130,
                      height: 110,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.95),
                            Colors.grey.shade200,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                          count,
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkPrimaryColor,
                          shadows: [
                            Shadow(
                              color: AppColors.goldPrimaryColor.withOpacity(0.5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    );
  }
}