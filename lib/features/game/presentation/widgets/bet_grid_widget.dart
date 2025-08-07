import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/bloc/betting/betting_cubit.dart';
import '../widgets/bet_cell.dart';
import '../widgets/ball_label.dart';
import '../widgets/table_header.dart';

class BettingGrid extends StatefulWidget {
  final List<List<int>> bettingGrid;

  const BettingGrid({super.key, required this.bettingGrid});

  @override
  State<BettingGrid> createState() => BettingGridState();
}

class BettingGridState extends State<BettingGrid> {
  late List<List<int>> grid;
  late List<List<bool>> tappedGrid;

  @override
  void initState() {
    super.initState();
    grid = List.generate(
      widget.bettingGrid.length,
      (i) => List<int>.from(widget.bettingGrid[i]),
    );
    tappedGrid = List.generate(
      widget.bettingGrid.length,
      (i) => List<bool>.filled(widget.bettingGrid[i].length, false),
    );
  }

  void _incrementBet(int row, int col) {
    final betAmount = context.read<BettingCubit>().state.betAmount;

    setState(() {
      if (grid[row][col] == 0) {
        grid[row][col] = betAmount < 5 ? 5 : betAmount;
      } else {
        grid[row][col] += betAmount;
      }
      tappedGrid[row][col] = true;
    });
  }

  void clearBets() {
    setState(() {
      for (int i = 0; i < grid.length; i++) {
        for (int j = 0; j < grid[i].length; j++) {
          grid[i][j] = 0;
          tappedGrid[i][j] = false;
        }
      }
    });
  }

  String _getPlaceSuffix(int index) {
    if (index == 1) return "st";
    if (index == 2) return "nd";
    if (index == 3) return "rd";
    return "th";
  }

  @override
  Widget build(BuildContext context) {
    final int rows = 6;
    final int cols = 6;
    final screenWidth = MediaQuery.of(context).size.width;

    double cornerWidth;
    double cornerHeight;
    double cornerFontSize;

    if (screenWidth <= 450) {
      cornerWidth = 40;
      cornerHeight = 34;
      cornerFontSize = 9.5;
    } else if (screenWidth <= 650) {
      cornerWidth = 56;
      cornerHeight = 42;
      cornerFontSize = 10.5;
    } else {
      cornerWidth = 70;
      cornerHeight = 48;
      cornerFontSize = 13;
    }

    final cellSize = cornerWidth;

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
                  width: cornerWidth,
                  height: cornerHeight,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1D293D),
                    border: Border.all(color: const Color(0xFF45556C)),
                  ),
                  margin: const EdgeInsets.all(1),
                  child: Text(
                    "Ball/Place",
                    style: TextStyle(
                      fontSize: cornerFontSize,
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
                        isTapped: tappedGrid[row][col],
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
}
