// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:islami/core/services/reciters_service/reciters_service.dart';
import 'package:islami/features/radioReciters/data/models/reciters_model.dart';
import 'package:islami/features/radioReciters/widgets/reciters_item.dart';
import 'package:islami/features/radioReciters/widgets/reciters_search_textfield.dart';

class RecitersBody extends StatefulWidget {
  const RecitersBody({super.key});

  @override
  State<RecitersBody> createState() => _RecitersBodyState();
}

class _RecitersBodyState extends State<RecitersBody> {
  final RecitersService recitersService = RecitersService();
  final TextEditingController searchController = TextEditingController();

  List<ReciterModel> allReciters = [];
  List<ReciterModel> filteredReciters = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _loadReciters();
  }

  Future<void> _loadReciters() async {
    try {
      final reciters = await recitersService.fetchReciters();
      setState(() {
        allReciters = reciters;
        filteredReciters = reciters;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'حدث خطأ أثناء تحميل القراء 😢';
        isLoading = false;
      });
    }
  }

  void _filterReciters(String query) {   // search function
    final results = allReciters.where((reciter) {
      final name = (reciter.name ).toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredReciters = results;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (errorMessage != null) {
      return Center(
        child: Text(
          errorMessage!,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      );
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ✅ TextField for searching
            RecitersSearchTextfield(
              onChanged: _filterReciters,
              searchController: searchController,
              iconOnPressed: () {
                searchController.clear();
                _filterReciters('');
              },
            ),

            const SizedBox(height: 10),
            //Display results
            if (filteredReciters.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Center(
                  child: Text(
                    'لا يوجد نتائج للبحث 😅',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              )
            else
              ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: filteredReciters.length,
                shrinkWrap: true, // ✅ مهم جدًا
                physics: const NeverScrollableScrollPhysics(), // ✅ منع التمرير الداخلي
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: RecitersItem(
                      reciterModel: filteredReciters[index],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}