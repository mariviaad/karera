import 'dart:async';
import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class BetCountdown extends StatefulWidget {
  final VoidCallback onCountdownFinish;
  const BetCountdown({super.key, required this.onCountdownFinish});

  @override
  State<BetCountdown> createState() => _BetCountdownState();
}

class _BetCountdownState extends State<BetCountdown> {
  int secondsLeft = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          widget.onCountdownFinish();
          secondsLeft = 60;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double shapeWidth;
    double shapeHeight;
    double secondsFontSize;

    if (screenWidth < 400) {
      shapeWidth = 38;
      shapeHeight = 38;
      secondsFontSize = 14.5;
    } else {
      shapeWidth = 42;
      shapeHeight = 42;
      secondsFontSize = 18;
    }

    return Container(
      width: shapeWidth,
      height: shapeHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.borderRed,
        border: Border.all(color: AppColors.ballRed, width: 2),
      ),
      child: Center(
        child: Text(
          "$secondsLeft",
          style: TextStyle(
            fontSize: secondsFontSize,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
