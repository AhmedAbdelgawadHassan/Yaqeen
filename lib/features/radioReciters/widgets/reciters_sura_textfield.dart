// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class RecitersSuraTextfield extends StatelessWidget {
  const RecitersSuraTextfield({
    super.key,
    required this.searchController,
    required this.onChanged,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber.withOpacity(0.25),
              Colors.black.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          controller: searchController,
          onChanged: onChanged,
          textAlign: TextAlign.right,
          cursorColor: Colors.amberAccent,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            height: 1.4,
          ),
          decoration: InputDecoration(
            hintText: ' ابحث عن سورة......',
            hintStyle: TextStyle(
              color: Colors.amber.shade200.withOpacity(0.8),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
            prefixIcon: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.amberAccent, Colors.orangeAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Icon(Icons.search, color: Colors.black, size: 24),
            ),
            filled: true,
            fillColor: Colors.black.withOpacity(0.4),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: Colors.amber.withOpacity(0.7),
                width: 1.4,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Colors.amberAccent,
                width: 1.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
