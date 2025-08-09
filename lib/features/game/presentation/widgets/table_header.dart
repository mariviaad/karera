import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class TableHeader extends StatelessWidget {
  final String label;
  final double width;

  const TableHeader({super.key, required this.label, required this.width});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive sizing
    double containerWidth;
    double containerHeight;
    double fontSizeRank;
    double fontSizeText;

    if (screenWidth <= 450) {
      containerWidth = 40;
      containerHeight = 34;
      fontSizeRank = 10.5;
      fontSizeText = 9.5;
    } else if (screenWidth <= 650) {
      containerWidth = 56;
      containerHeight = 42;
      fontSizeRank = 10.5;
      fontSizeText = 10.5;
    } else {
      containerWidth = 70;
      containerHeight = 48;
      fontSizeRank = 13;
      fontSizeText = 12;
    }

    final parts = label.split(' ');
    final rank = parts.isNotEmpty ? parts[0] : '';
    final text = parts.length > 1 ? parts[1] : '';

    return Container(
      width: containerWidth,
      height: containerHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.gridBlueGrey,
        border: Border.all(color: AppColors.hoverGrey),
      ),
      margin: const EdgeInsets.all(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rank,
            style: TextStyle(
              fontSize: fontSizeRank,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: fontSizeText,
              fontWeight: FontWeight.w300,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
