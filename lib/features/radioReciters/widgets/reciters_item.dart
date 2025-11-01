import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/radioReciters/data/models/reciters_model.dart';
import 'package:islami/shared/customText.dart';

class RecitersItem extends StatelessWidget {
  const RecitersItem({super.key, required this.recitersModel});
  final RecitersModel recitersModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: AppColors.goldPrimaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            offset: const Offset(0, 3),
        )]
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom:100,
            left: 0,
            right: 0,
            child: Customtext(text: recitersModel.recitersName,color: Colors.black,fontSize: 20,)),
          Image(image: AssetImage('assets/images/root/soundWave 1.png')),
          // Positioned(
          //   left: 120,
          //   child: Row(
          //     children: [
          //       IconButton(onPressed: () {
          //       }, icon: Icon(Icons.play_arrow,color: Colors.black,size: 60,)),
          //        IconButton(onPressed: () {
          //       }, icon: Icon(Icons.mic,color: Colors.black,size: 40,)),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}