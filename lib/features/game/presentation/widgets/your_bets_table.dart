import 'package:flutter/material.dart';
import 'package:karera/features/game/presentation/widgets/your_bets_grid.dart';
import 'package:karera/features/game/presentation/widgets/your_bets_header.dart';

class YourBetsTable extends StatefulWidget {
  const YourBetsTable({super.key});

  @override
  State<YourBetsTable> createState() => _YourBetsTableState();
}

class _YourBetsTableState extends State<YourBetsTable> {
  late List<List<int?>> betGrid;
  late List<List<bool>> resultGrid;

  @override
  void initState() {
    super.initState();
    betGrid = List.generate(6, (_) => List.filled(6, null));
    resultGrid = List.generate(6, (_) => List.filled(6, false));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            YourBetsHeader(label: 'B/P'),
            YourBetsHeader(label: '1st'),
            YourBetsHeader(label: '2nd'),
            YourBetsHeader(label: '3rd'),
            YourBetsHeader(label: '4th'),
            YourBetsHeader(label: '5th'),
            YourBetsHeader(label: '6th'),
          ],
        ),
        const SizedBox(height: 3),
        Table(
          defaultColumnWidth: const IntrinsicColumnWidth(),
          children: List.generate(6, (rowIndex) {
            return TableRow(
              children: [
                BallLabel(ballNumber: rowIndex + 1),
                for (int col = 0; col < 6; col++)
                  YourBetsGrid(
                    amount: betGrid[rowIndex][col],
                    isWinningResult: resultGrid[rowIndex][col],
                  ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
