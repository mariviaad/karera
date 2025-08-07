import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/widgets/hover_button.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    double fontSizeBalance;
    double fontSizeAmount;

    if (screenwidth <= 750) {
      fontSizeBalance = 10.5;
      fontSizeAmount = 12.25;
    } else {
      fontSizeBalance = 12.25;
      fontSizeAmount = 14;
    }

    return Container(
      width: double.infinity,
      padding: screenwidth <= 750
          ? EdgeInsets.symmetric(vertical: 4, horizontal: 6)
          : EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.buttonBlueGrey,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Text(
            "Balance:",
            style: TextStyle(
              color: AppColors.fontGrey,
              fontSize: fontSizeBalance,
            ),
          ),
          SizedBox(width: 4),
          Text(
            "₱1,250.75",
            style: TextStyle(
              color: AppColors.yellow,
              fontSize: fontSizeAmount,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8),
          HoverTextButton(text: "DEPOSIT", onTap: () {}),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: HoverTextIconButton(label: "HOW TO PLAY", onTap: () {}),
            ),
          ),
        ],
      ),
    );
  }
}
