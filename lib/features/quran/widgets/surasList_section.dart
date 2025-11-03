// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:islami/features/quran/data/models/sura_model.dart';
import 'package:islami/features/quran/views/suraText_view.dart';
import 'package:islami/features/quran/widgets/sura_item.dart';
import 'package:islami/shared/customText.dart';

class SuraslistSection extends StatefulWidget {
  const SuraslistSection({super.key, required this.suraList});
  final List<SuraModel> suraList ;

  @override
  State<SuraslistSection> createState() => _SuraslistSectionState();
}

class _SuraslistSectionState extends State<SuraslistSection> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(20),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Customtext(text: 'Suras List', color: Colors.white),
        ),
        const Gap(20),
        Expanded(
          child: ListView.builder(
            itemCount: widget.suraList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () async {
                    // تحميل نص السورة من الملف
                    String content = await rootBundle.loadString(
                      'assets/files/suras/${widget.suraList[index].suraIndex}.txt',
                    );
                    // تقسيم السورة إلى آيات (كل سطر = آية)
                    List<String> ayat = content.trim().split('\n');
                    // إضافة رقم الآية في نهاية كل سطر
                    String formattedContent = '';
                    for (int i = 0; i < ayat.length; i++) {
                      formattedContent += '${ayat[i].trim()} {${i + 1}} ';
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SuratextView(
                          suraNameAr: widget.suraList[index].suraNameAr,
                          suraNameEn: widget.suraList[index].suraNameEn,
                          suraIndex: widget.suraList[index].suraIndex,
                          suraText: formattedContent,
                        ),
                      ),
                    );
                  },
                  child: SuraItem(suraModel: widget.suraList[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
