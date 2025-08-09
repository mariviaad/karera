import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class BetCell extends StatelessWidget {
  final int amount;
  final int chance;
  final double size;
  final VoidCallback onTap;
  final bool isTapped;

  const BetCell({
    super.key,
    required this.amount,
    required this.chance,
    required this.onTap,
    required this.size,
    required this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double outerWidth;
    double outerHeight;
    double fontSizeAmount;
    double fontSizeChance;

    if (screenWidth <= 450) {
      outerWidth = 40;
      outerHeight = 34;
      fontSizeAmount = 10;
      fontSizeChance = 8.5;
    } else if (screenWidth <= 650) {
      outerWidth = 56;
      outerHeight = 49;
      fontSizeAmount = 12.25;
      fontSizeChance = 10.5;
    } else {
      outerWidth = 70;
      outerHeight = 56;
      fontSizeAmount = 18;
      fontSizeChance = 14;
    }
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: outerWidth,
        height: outerHeight,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isTapped ? AppColors.lowOpRed : AppColors.black,
          border: Border.all(color: AppColors.borderRed, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$amount",
              style: TextStyle(
                fontSize: fontSizeAmount,
                color: AppColors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$chance",
              style: TextStyle(
                color: AppColors.ballRed,
                fontSize: fontSizeChance,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
