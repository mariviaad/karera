import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/core/dependency_injection.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/bloc/race_history/race_hist_bloc.dart';
import 'package:karera/features/game/presentation/widgets/race_history_table.dart';
import 'package:karera/features/game/presentation/widgets/your_bets.dart';

class HistoryMenu extends StatefulWidget {
  const HistoryMenu({super.key});

  @override
  HistoryMenuState createState() => HistoryMenuState();
}

class HistoryMenuState extends State<HistoryMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResultHistoryBloc>(
      create: (context) =>
          locator<ResultHistoryBloc>()..add(FetchResultHistory()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 31.5,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color(0xFF2E3D56),
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
            RaceHistoryTable()
          else
            YourBets(
              raceNumber: 5,
              isWin: true,
              betGrid: [
                [0, 20, 0, 0, 0, 0],
                [0, 0, 0, 10, 0, 0],
                [0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0],
                [0, 0, 0, 0, 0, 0],
              ],
              resultGrid: [
                [false, true, false, false, false, false],
                [false, false, false, true, false, false],
                [false, false, false, false, false, false],
                [false, false, false, false, false, false],
                [false, false, false, false, false, false],
                [false, false, false, false, false, false],
              ],
              totalBet: 30,
              totalWin: 60,
              totalLost: 0,
            ),
          const SizedBox(height: 10),
          if (selectedIndex == 0)
            Center(
              child: Text(
                'Last 10 races showing final positions • Latest race highlighted',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF90A1B9),
                  fontSize: 10.5,
                ),
              ),
            )
          else
            Center(
              child: Text(
                'Your betting history • Yellow numbers = Your bets • Gold cells = Race results',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF90A1B9),
                  fontSize: 10.5,
                ),
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
            color: isSelected ? const Color(0xFF3C4D68) : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.ballYellow : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
