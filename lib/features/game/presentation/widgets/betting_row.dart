import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/widgets/bet_amount.dart';
import 'package:karera/features/game/presentation/widgets/bet_countdown.dart';
import 'package:karera/features/game/presentation/widgets/bet_grid_widget.dart';
import 'package:karera/features/game/presentation/widgets/hover_text.dart';

class BettingRow extends StatelessWidget {
  final GlobalKey<BettingGridState> bettingGridKey;
  final VoidCallback? onCountdownFinish;

  const BettingRow({
    super.key,
    required this.bettingGridKey,
    this.onCountdownFinish,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            const SizedBox(width: 12),
            BetCountdown(
              onCountdownFinish: () {
                bettingGridKey.currentState?.clearBets();
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
        Center(
          child: HoverTextButton(
            text: "Clear Bets",
            onTap: () {
              bettingGridKey.currentState?.clearBets();
            },
          ),
        ),
      ],
    );
  }
}
