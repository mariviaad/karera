import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: width <= 1000
          ? EdgeInsets.symmetric(vertical: 8, horizontal: 12)
          : EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.gameBackground,
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF2A394F),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(
              children: [
                Text(
                  "Balance:",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                SizedBox(width: 10),
                Text(
                  "₱1,250.75",
                  style: TextStyle(
                    color: const Color.fromRGBO(253, 199, 0, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
