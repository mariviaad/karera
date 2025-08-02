import 'package:flutter/material.dart';

class YourBetsGrid extends StatelessWidget {
  final int? amount;
  final bool isWinningResult;

  const YourBetsGrid({super.key, this.amount, this.isWinningResult = false});

  @override
  Widget build(BuildContext context) {
    final bool isBetPlaced = amount != null;

    final Color backgroundColor = isWinningResult
        ? const Color(0x66FE9A00)
        : isBetPlaced
        ? const Color(0x33FB2C36)
        : const Color(0x33000000);

    final Color borderColor = isWinningResult
        ? const Color(0xFFFFB900)
        : isBetPlaced
        ? const Color(0xFFFB2C36)
        : const Color(0xFF45556C); //

    return Container(
      width: 28,
      height: 28,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Center(
        child: isBetPlaced
            ? Text(
                '$amount',
                style: const TextStyle(
                  fontSize: 12.25,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
