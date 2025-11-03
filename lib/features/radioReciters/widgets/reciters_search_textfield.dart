import 'package:flutter/material.dart';

class RecitersSearchTextfield extends StatelessWidget {
  const RecitersSearchTextfield({super.key,required this.onChanged, required this.searchController, required this.iconOnPressed});
  final  TextEditingController searchController ;
  final void Function(String)? onChanged;
  final VoidCallback iconOnPressed;

  @override

  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
              child: TextField(
                controller: searchController,
                onChanged:onChanged ,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'ابحث عن القارئ...',
                  hintStyle: const TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(Icons.search, color: Colors.white70),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon:
                              const Icon(Icons.close, color: Colors.white70),
                          onPressed: iconOnPressed
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            );
  }
}