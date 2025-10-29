import 'package:flutter/material.dart';
import 'package:islami/features/radio/data/models/radio_model.dart';
import 'package:islami/features/radio/widgets/radio_item.dart';


class RadioBody extends StatelessWidget {
  const RadioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (context, index) {
        return  Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: RadioItem(
            radioModel: RadioModel(radioName: 'Radio Ahmed Al-trabulsi', radioSoundUrl: 'Radio Ahmed Al-trabulsi'),
          ),
        );
      },),
    );
  }
}