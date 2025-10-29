import 'package:flutter/material.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/hadith/data/models/hadith_model.dart';
import 'package:islami/shared/customText.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.hadithModel});
  final HadithModel hadithModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width * 0.77,
      height: MediaQuery.of(context).size.height * 0.63,
      decoration: BoxDecoration(
        color: AppColors.goldPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/root/left_corner.png'),
                width: 92,
                height: 92,
              ),
              Expanded(
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Customtext(
                      text: hadithModel.hadithNumber,
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Image(
                image: AssetImage('assets/images/root/right_corner.png'),
                width: 92,
                height: 92,
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Customtext(
                text: hadithModel.hadithText,
                color: Colors.black,
                maxLines: 15,
                fontSize: 16,
              ),
            ),
          ),
          Image(image: AssetImage('assets/images/root/Mosque-02 2.png')),
        ],
      ),
    );
  }
}
