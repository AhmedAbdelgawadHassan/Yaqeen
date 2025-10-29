import 'package:flutter/material.dart';
import 'package:islami/shared/customText.dart';

class RadioRecitersContainer extends StatelessWidget {
  const RadioRecitersContainer({super.key, required this.containerColor, required this.textColor, required this.text});
  final Color containerColor;
  final Color textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 700),
      width: 175,
      margin: EdgeInsets.only(left: 5,right: 5),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white,width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
          )
        ]
      ),
      child: Customtext(text: text,fontSize: 17,color: textColor),
      );
  }
}