import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 56,
        height: 49,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isTapped
              ? const Color.fromRGBO(251, 44, 54, .2)
              : Colors.black,
          border: Border.all(color: Colors.red, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$amount",
              style: const TextStyle(
                fontSize: 12.25,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "$chance",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 10.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
