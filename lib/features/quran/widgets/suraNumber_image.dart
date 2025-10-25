import 'package:flutter/material.dart';
import 'package:islami/shared/customText.dart';

class SuranumberImage extends StatelessWidget {
  const SuranumberImage({super.key, required this.suraNumber});
  final int suraNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
         Positioned(
          left:21.5,
          top: 17,
          child:Customtext(text: suraNumber.toString(),color: Colors.white,fontSize: 14,), ),
        Image(image: AssetImage('assets/images/root/arabic-art-svgrepo-com 1 (1).png'),height: 50,width: 50,),
       
      ],
    );
  }
}