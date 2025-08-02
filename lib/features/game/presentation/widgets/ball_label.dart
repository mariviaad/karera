import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

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
      width: 56,
      height: 49,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF314158),
        border: Border.all(color: Color(0xFF45556C)),
      ),
      margin: const EdgeInsets.all(1),
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors[(ballNumber - 1) % colors.length],
        ),
        alignment: Alignment.center,
        child: Text(
          "$ballNumber",
          style: TextStyle(
            color: textColor,
            fontSize: 12.25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
