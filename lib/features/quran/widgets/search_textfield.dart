import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islami/core/constants/app_colors.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.goldPrimaryColor)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.goldPrimaryColor),
            ),
            prefixIcon: Icon(FontAwesomeIcons.bookQuran,color: AppColors.goldPrimaryColor,),
            hintText: 'Sura Name',
            hintStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
        ),
        ),
    );
  }
}
