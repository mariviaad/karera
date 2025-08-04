import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class ResultBall extends StatelessWidget {
  final int number;

  const ResultBall({super.key, required this.number});

  static const List<Color> ballColors = [
    AppColors.ballRed,
    AppColors.ballBlue,
    AppColors.ballGreen,
    AppColors.ballYellow,
    AppColors.ballViolet,
    AppColors.ballOrange,
  ];

  static const List<Color> textColors = [
    AppColors.white,
    AppColors.white,
    AppColors.white,
    AppColors.black,
    AppColors.white,
    AppColors.white,
  ];

  @override
  Widget build(BuildContext context) {
    final color = ballColors[number - 1];
    final textColor = textColors[number - 1];
    final screenWidth = MediaQuery.of(context).size.width;
    final double size = screenWidth < 1000 ? 17.5 : 28;
    final double fontSize = screenWidth < 1000 ? 10.5 : 14;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        number.toString(),
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}

class StatusText extends StatelessWidget {
  const StatusText({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double fontSize = 12.25;
    if (screenWidth < 1000) {
      fontSize = 10.5;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0x1805DF72),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        "Latest",
        style: TextStyle(
          color: AppColors.textGreen,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
