import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import '../widgets/bet_cell.dart';
import '../widgets/ball_label.dart';
import '../widgets/table_header.dart';

class BettingGrid extends StatefulWidget {
  final List<List<int>> bettingGrid;

  const BettingGrid({super.key, required this.bettingGrid});

  @override
  State<BettingGrid> createState() => _BettingGridState();
}

class _BettingGridState extends State<BettingGrid> {
  late List<List<int>> grid;

  @override
  void initState() {
    super.initState();
    // Deep copy of initial grid so we can update it locally
    grid = List.generate(
      widget.bettingGrid.length,
      (i) => List<int>.from(widget.bettingGrid[i]),
    );
  }

  void _incrementBet(int row, int col) {
    setState(() {
      if (grid[row][col] == 0) {
        grid[row][col] = 5;
      } else {
        grid[row][col] += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final int rows = 6;
    final int cols = 6;
    final screenWidth = MediaQuery.of(context).size.width;
    final cellSize = (screenWidth - 100) / (cols + 1);

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 56,
                  height: 42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(29, 41, 61, 1),
                    border: Border.all(color: Color(0xFF45556C)),
                  ),
                  margin: const EdgeInsets.all(1),
                  child: const Text(
                    "Ball/Place",
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                for (int col = 1; col <= cols; col++)
                  TableHeader(
                    label: "$col${_getPlaceSuffix(col)} Place",
                    width: cellSize,
                  ),
              ],
            ),
            const SizedBox(height: 6),
            // Bet cells
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(rows, (row) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BallLabel(ballNumber: row + 1),
                    for (int col = 0; col < cols; col++)
                      BetCell(
                        amount: grid[row][col],
                        chance: [19, 11, 15, 2, 7, 15][col % 6],
                        onTap: () => _incrementBet(row, col),
                        size: cellSize,
                      ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  String _getPlaceSuffix(int index) {
    if (index == 1) return "st";
    if (index == 2) return "nd";
    if (index == 3) return "rd";
    return "th";
  }
}
