import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/core/dependency_injection.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/data/models/bet_item.dart';
import 'package:karera/features/game/presentation/bloc/result_history/result_hist_bloc.dart';
import 'package:karera/features/game/presentation/bloc/current_bets/current_bets_bloc.dart';
import 'package:karera/features/game/presentation/widgets/race_history_table.dart';
import 'package:karera/features/game/presentation/widgets/your_bets_widget.dart';

class HistoryMenu extends StatefulWidget {
  const HistoryMenu({super.key});

  @override
  HistoryMenuState createState() => HistoryMenuState();
}

class HistoryMenuState extends State<HistoryMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ResultHistoryBloc>(
          create: (context) =>
              locator<ResultHistoryBloc>()..add(FetchResultHistory()),
        ),
        BlocProvider<CurrentBetsBloc>(
          create: (context) =>
              locator<CurrentBetsBloc>()..add(FetchCurrentBets()),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 31.5,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppColors.gridBlueGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildTab("Race History", 0),
                _buildTab("Your Bets", 1),
              ],
            ),
          ),

          const SizedBox(height: 12),

          if (selectedIndex == 0)
            const RaceHistoryTable()
          else
            BlocBuilder<CurrentBetsBloc, CurrentBetsState>(
              builder: (context, state) {
                if (state is CurrentBetsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CurrentBetsLoaded) {
                  final sortedItems = [...state.betItems]
                    ..sort((a, b) => b.raceNum.compareTo(a.raceNum));
                  final recentItems = sortedItems.take(5).toList();

                  return Column(
                    children: recentItems.map((betItem) {
                      final netAmount = betItem.netAmount;

                      final matchingStateItem = state.betItems.firstWhere(
                        (item) => item.raceNum == betItem.raceNum,
                        orElse: () => betItem,
                      );

                      return YourBets(
                        raceNumber: matchingStateItem.raceNum,
                        isWin: netAmount > 0,
                        totalBet: matchingStateItem.totalBetAmount,
                        totalWin: netAmount > 0 ? netAmount : 0,
                        totalLost: netAmount < 0 ? netAmount : 0,
                        betGrid: buildBetGridFromItem(matchingStateItem),
                        resultGrid: buildResultGridFromItem(matchingStateItem),
                        betItems: state.betItems,
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(child: Text("No bets found."));
                }
              },
            ),

          const SizedBox(height: 10),

          Center(
            child: Text(
              selectedIndex == 0
                  ? 'Last 10 races showing final positions • Latest race highlighted'
                  : 'Your betting history • Yellow numbers = Your bets • Gold cells = Race results',
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.textGrey, fontSize: 10.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 25.5,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.hoverGrey : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12.25,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.yellow : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  List<List<int?>> buildBetGridFromItem(BetItem item) {
    List<List<int?>> grid = List.generate(6, (_) => List.filled(6, null));
    for (var entry in item.betAmount.placedBets.entries) {
      final number = entry.key - 1;
      final row = number ~/ 6;
      final col = number % 6;
      grid[row][col] = entry.value;
    }
    return grid;
  }

  List<List<bool>> buildResultGridFromItem(BetItem item) {
    List<List<bool>> grid = List.generate(6, (_) => List.filled(6, false));
    for (var number in item.resultPlacing.resultNumbers) {
      final index = number - 1;
      final row = index ~/ 6;
      final col = index % 6;
      grid[row][col] = true;
    }
    return grid;
  }
}
