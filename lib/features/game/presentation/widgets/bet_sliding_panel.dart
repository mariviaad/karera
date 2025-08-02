import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/widgets/balance_widget.dart';
import 'package:karera/features/game/presentation/widgets/bet_grid_widget.dart';
import 'package:karera/features/game/presentation/widgets/betting_row.dart';
import 'package:karera/features/game/presentation/widgets/history_menu.dart';

class BetSlidingPanel extends StatefulWidget {
  const BetSlidingPanel({super.key});

  @override
  State<BetSlidingPanel> createState() => BetSlidingPanelState();
}

class BetSlidingPanelState extends State<BetSlidingPanel> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<BettingGridState> _bettingGridKey =
      GlobalKey<BettingGridState>();
  final List<List<int>> _grid = List.generate(6, (_) => List.filled(6, 0));

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.gameBackground),
      constraints: BoxConstraints(minHeight: 0, maxHeight: width * 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: width <= 1000
                ? EdgeInsets.symmetric(horizontal: width * 0.025, vertical: 14)
                : EdgeInsets.all(16),
            child: const BalanceWidget(),
          ),
          Expanded(
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(Color(0xFF9F9F9F)),
                trackColor: WidgetStateProperty.all(Color(0xFF2C2C2C)),
                trackBorderColor: WidgetStateProperty.all(Colors.transparent),
                interactive: true,
                radius: const Radius.circular(8),
                thickness: WidgetStateProperty.all(10),
              ),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                trackVisibility: true,
                interactive: true,
                scrollbarOrientation: ScrollbarOrientation.right,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: Text(
                            "Tap on a cell to bet (Min: ₱5)",
                            style: TextStyle(
                              color: const Color(0xCCFFFFFF),
                              fontSize: 10.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 1),
                        Center(
                          child: BettingGrid(
                            key: _bettingGridKey,
                            bettingGrid: _grid,
                          ),
                        ),
                        const SizedBox(height: 6),
                        BettingRow(
                          bettingGridKey: _bettingGridKey,
                          onCountdownFinish: () {
                            _bettingGridKey.currentState?.clearBets();
                          },
                        ),
                        const SizedBox(height: 30),
                        const HistoryMenu(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
