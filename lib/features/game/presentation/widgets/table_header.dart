import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class TableHeader extends StatelessWidget {
  final String label;
  final double width;

  const TableHeader({super.key, required this.label, required this.width});

  @override
  Widget build(BuildContext context) {
    // Split label: assume format like "1st Place"
    final parts = label.split(' ');
    final rank = parts.isNotEmpty ? parts[0] : '';
    final text = parts.length > 1 ? parts[1] : '';

    return Container(
      width: 56,
      height: 42,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF314158),
        border: Border.all(color: Color(0xFF45556C)),
      ),
      margin: const EdgeInsets.all(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rank,
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w300,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
