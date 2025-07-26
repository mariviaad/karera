import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/widgets/balance_widget.dart';
import 'package:karera/features/game/presentation/widgets/bet_amount.dart';
import 'package:karera/features/game/presentation/widgets/bet_grid_widget.dart';

class BetSlidingPanel extends StatefulWidget {
  const BetSlidingPanel({super.key});

  @override
  State<BetSlidingPanel> createState() => BetSlidingPanelState();
}

class BetSlidingPanelState extends State<BetSlidingPanel> {
  final ScrollController _scrollController = ScrollController();

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
          // ✅ BalanceWidget with padding
          Padding(
            padding: width <= 1000
                ? EdgeInsets.symmetric(horizontal: width * 0.025, vertical: 14)
                : EdgeInsets.all(16),
            child: const BalanceWidget(),
          ),
          const SizedBox(height: 12.5),
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
                      const SizedBox(height: 2),
                      Center(
                        child: BettingGrid(
                          bettingGrid: List.generate(
                            6,
                            (_) => List.filled(6, 0),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const BetAmountWidget(),
                          const SizedBox(width: 12),
                          Column(
                            children: [
                              Text(
                                "-BET",
                                style: TextStyle(
                                  color: AppColors.ballYellow,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "-ODDS",
                                style: TextStyle(
                                  color: AppColors.ballRed,
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Placeholder(
                            fallbackHeight: 50,
                            fallbackWidth: 50,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
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
