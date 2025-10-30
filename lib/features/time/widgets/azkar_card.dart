import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/shared/customText.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({super.key, required this.image, required this.text, required this.onTap});
  final String image ;
  final String text ;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child:  Container(
          width: MediaQuery.of(context).size.width * 0.5-20,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: Color(0xff836A3E),
              width: 2
            )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                Image(image: AssetImage(image),
                width: 185,height: 185,),
                Gap(5),
                Customtext(text: text,color: Colors.white,fontSize: 18,)
              ],
            ),
          ),
        ),
    );
  }
}