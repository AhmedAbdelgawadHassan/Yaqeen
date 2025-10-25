import 'package:flutter/material.dart';
import 'package:islami/features/quran/widgets/mostRecently_section.dart';
import 'package:islami/features/quran/widgets/search_textfield.dart';
import 'package:islami/features/quran/widgets/surasList_section.dart';
import 'package:islami/shared/logo_widget.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: LogoWidget(height: 100,),
                  ),
                  SliverToBoxAdapter(
                    child: SearchTextfield(),
                  ),
                  SliverToBoxAdapter(
                    child: MostrecentlySection(),
                  ),
                  SliverFillRemaining(
                    child: SuraslistSection(),
                  )
                ],
              )
            ),
          ),
        ),
      ],
    );
  }
}
