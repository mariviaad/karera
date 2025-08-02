import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class YourBetsHeader extends StatelessWidget {
  final String label;

  const YourBetsHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final isBP = label.toUpperCase() == 'B/P';
    return Container(
      width: 28,
      height: 21,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isBP ? const Color(0xFF1D293D) : const Color(0xFF314158),
        border: Border.all(color: AppColors.hoverGrey),
      ),
      margin: const EdgeInsets.all(1),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class BallLabel extends StatelessWidget {
  final int ballNumber;

  const BallLabel({super.key, required this.ballNumber});

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppColors.ballRed,
      AppColors.ballBlue,
      AppColors.ballGreen,
      AppColors.ballYellow,
      AppColors.ballViolet,
      AppColors.ballOrange,
    ];

    final ballColor = colors[(ballNumber - 1) % colors.length];
    final textColor = ballColor == AppColors.ballYellow
        ? AppColors.black
        : AppColors.white;

    return Container(
      width: 28,
      height: 28,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF314158),
        border: Border.all(color: AppColors.hoverGrey),
      ),
      margin: const EdgeInsets.all(1),
      child: Container(
        width: 14,
        height: 14,
        decoration: BoxDecoration(shape: BoxShape.circle, color: ballColor),
        alignment: Alignment.center,
        child: Text(
          "$ballNumber",
          style: TextStyle(
            color: textColor,
            fontSize: 10.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
