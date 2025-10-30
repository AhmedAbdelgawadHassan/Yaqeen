import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/features/time/views/eveningAzkar_view.dart';
import 'package:islami/features/time/views/morningAzkar_view.dart';
import 'package:islami/features/time/widgets/azkar_card.dart';
import 'package:islami/shared/customText.dart';

class AzkarSection extends StatelessWidget {
  const AzkarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(text: 'Azkar', fontSize: 20, color: Colors.white),
        Gap(25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AzkarCard(
              image: 'assets/images/root/comment-bubble-icon 1.png',
              text: 'Morning Azkar',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MorningAzkarView(),));
              },
            ),
             AzkarCard(
              image: 'assets/images/root/bell-icon 1.png',
              text: 'Evening Azkar',
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => EveningAzkarView(),));
              },
            ),
          ],
        ),
       
      ],
    );
  }
}
