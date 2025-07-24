import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/widgets/balance_widget.dart';
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
      padding: width <= 1000
          ? EdgeInsets.symmetric(horizontal: width * 0.025, vertical: 14)
          : EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.gameBackground),
      constraints: BoxConstraints(minHeight: 0, maxHeight: width * 2.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const BalanceWidget(),
          const SizedBox(height: 23.5),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thickness: 6,
              radius: const Radius.circular(8),
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
                        bettingGrid: List.generate(6, (_) => List.filled(6, 0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
