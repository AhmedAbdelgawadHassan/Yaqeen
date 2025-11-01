import 'package:flutter/material.dart';
import 'package:islami/features/radioReciters/data/models/reciters_model.dart';
import 'package:islami/features/radioReciters/widgets/reciters_item.dart';


class RecitersBody extends StatelessWidget {
  const RecitersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 20,
        itemBuilder: (context, index) {
        return  Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: RecitersItem(recitersModel: RecitersModel(recitersName: 'Ibrahim Al-Akdar', recitersSoundUrl: ''))
        );
      },),
    );
  }
}