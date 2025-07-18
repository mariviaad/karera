import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/widgets/balance_widget.dart';

class BetSlidingPanel extends StatefulWidget {
  @override
  State<BetSlidingPanel> createState() => BetSlidingPanelState();
}

class BetSlidingPanelState extends State<BetSlidingPanel> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    BalanceWidget();
    return Container(
      padding: width <= 1000
          ? EdgeInsets.symmetric(horizontal: width * 0.25, vertical: 8)
          : EdgeInsets.all(10),
      decoration: BoxDecoration(color: AppColors.gameBackground),
      width: width,
      constraints: BoxConstraints(maxWidth: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [BalanceWidget()],
      ),
    );
  }
}
