import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/widgets/your_bets_table.dart';
import 'package:karera/features/game/presentation/widgets/your_bets_text.dart';

class YourBets extends StatelessWidget {
  final int raceNumber;
  final bool isWin;
  final List<List<int>> betGrid;
  final List<List<bool>> resultGrid;
  final int totalBet;
  final int totalWin;
  final int totalLost;

  const YourBets({
    super.key,
    required this.raceNumber,
    required this.isWin,
    required this.betGrid,
    required this.resultGrid,
    required this.totalBet,
    required this.totalWin,
    required this.totalLost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(22, 32, 51, 1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromRGBO(69, 85, 108, 1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YourBetsText(
            raceNumber: raceNumber,
            isWin: isWin,
            totalBet: totalBet,
            totalWin: totalWin,
            totalLost: totalLost,
          ),
          const SizedBox(height: 6),
          Center(child: YourBetsTable()),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
