import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islami/core/constants/app_colors.dart';
import 'package:islami/features/radio/widgets/radio_body.dart';
import 'package:islami/features/radio/widgets/radio_reciters_container.dart';
import 'package:islami/features/radio/widgets/reciters_body.dart';
import 'package:islami/shared/logo_widget.dart';

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(10),
              LogoWidget(
                height: 120,
              ),
              Gap(10),
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        currentIndex = index;
                        setState(() {});
                      },
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7.5),
                          child: RadioRecitersContainer(
                            containerColor: currentIndex == index
                                ? AppColors.goldPrimaryColor
                                : Color(0xff2D2C2B),
                            textColor: currentIndex == index
                                ? Colors.black
                                : Colors.white,
                            text: index == 0 ? 'Radio' : 'Reciters',  // change text according to index
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(30),
              currentIndex == 0 ? RadioBody() : RecitersBody(),
              // change body according to index (container Clicked)
            ],
          ),
        ),
      ),
    );
  }
}
