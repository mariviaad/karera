import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class BallLabel extends StatelessWidget {
  final int ballNumber;

  const BallLabel({super.key, required this.ballNumber});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double outerWidth;
    double outerHeight;
    double innerSize;
    double fontSize;

    if (screenWidth <= 450) {
      outerWidth = 40;
      outerHeight = 34;
      innerSize = 20;
      fontSize = 10.5;
    } else if (screenWidth <= 650) {
      outerWidth = 56;
      outerHeight = 49;
      innerSize = 28;
      fontSize = 12.25;
    } else {
      outerWidth = 70;
      outerHeight = 56;
      innerSize = 35;
      fontSize = 18;
    }

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
      width: outerWidth,
      height: outerHeight,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.gridBlueGrey,
        border: Border.all(color: AppColors.hoverGrey),
      ),
      margin: const EdgeInsets.all(1),
      child: Container(
        width: innerSize,
        height: innerSize,
        decoration: BoxDecoration(shape: BoxShape.circle, color: ballColor),
        alignment: Alignment.center,
        child: Text(
          "$ballNumber",
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
