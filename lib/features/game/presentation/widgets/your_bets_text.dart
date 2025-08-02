import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class YourBetsText extends StatelessWidget {
  final int raceNumber;
  final bool isWin;
  final int totalBet;
  final int totalWin;
  final int totalLost;

  const YourBetsText({
    super.key,
    required this.raceNumber,
    required this.isWin,
    required this.totalBet,
    required this.totalWin,
    required this.totalLost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Race #$raceNumber',
                  style: const TextStyle(
                    fontSize: 12.25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isWin
                        ? const Color(0x1805DF72)
                        : const Color(0x18FF6467),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    isWin ? 'Won' : 'Lost',
                    style: TextStyle(
                      color: isWin
                          ? AppColors.textGreen
                          : const Color(0xFFFF6467),
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Total Bet: ₱$totalBet',
                  style: const TextStyle(
                    color: AppColors.yellow,
                    fontSize: 12.25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${isWin ? '+' : '-'}₱${isWin ? totalWin : totalLost}',
                  style: TextStyle(
                    color: isWin ? AppColors.textGreen : Colors.redAccent,
                    fontSize: 12.25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text(
              'Your Bets:',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              ' Gold = Race Result',
              style: TextStyle(
                color: AppColors.yellow,
                fontSize: 10.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
