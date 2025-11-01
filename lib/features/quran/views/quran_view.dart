import 'package:flutter/material.dart';
import 'package:islami/features/quran/data/models/sura_model.dart';
import 'package:islami/features/quran/widgets/search_textfield.dart';
import 'package:islami/features/quran/widgets/surasList_section.dart';
import 'package:islami/shared/logo_widget.dart';

class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  final TextEditingController searchController = TextEditingController();  //controller for the search field

  //complete list
  final List<SuraModel> suraList = SuraModel.suras;
  //filtered list
  List<SuraModel> filteredItems = [];  // filtered list that displayed in the UI

  @override
  void initState() {
    super.initState();
    //  in Start display all items
       filteredItems = suraList;
  }

  // منطق البحث
  void filterSearch(String query) {  // search function
    if (query.isEmpty) {
      setState(() {
        filteredItems = suraList;  // if user doesn't type anything yet display all items
      });
    } else {
      setState(() {
        filteredItems = suraList
            .where((item) =>
                item.suraNameAr.toLowerCase().contains(query.toLowerCase()) ||
                item.suraNameEn.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });   // the search with English and Arabic name for Sura
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: LogoWidget(height: 100),   // logo
              ),

              SliverToBoxAdapter(
                child: SearchTextfield(   // Textfield
                  controller: searchController,
                  onChanged: (value) {
                    filterSearch(value); // filter function
                  },
                ),
              ),

              // Sura List (filtered items)
              SliverFillRemaining(
                child: SuraslistSection(
                  suraList: filteredItems, //Display filtered items
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
