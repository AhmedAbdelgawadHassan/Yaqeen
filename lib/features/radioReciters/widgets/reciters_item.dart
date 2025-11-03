import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/radioReciters/data/models/reciters_model.dart';
import 'package:islami/features/radioReciters/views/reciters_suras_view.dart';
import 'package:islami/shared/customText.dart';

class RecitersItem extends StatelessWidget {
  const RecitersItem({super.key, required this.reciterModel});
  final ReciterModel reciterModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecitersSurasView(reciterModel: reciterModel),
          ),
        );
      },
      child: Container(
        height: 150,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              Color(0xffD4AF37), // Gold
              Color(0xff836A3E), // Brown-gold
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Sound wave
            Positioned.fill(
              child: Opacity(
                opacity: 0.15, // to make sound wave transparent
                child: Image.asset(
                  'assets/images/root/soundWave 1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Reciter name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Customtext(
                      text: reciterModel.name,
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  // Play Icon
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.darkPrimaryColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(2, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecitersSurasView(reciterModel: reciterModel),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
