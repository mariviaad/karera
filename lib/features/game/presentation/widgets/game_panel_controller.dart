import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class GamePanelContent extends StatelessWidget {
  const GamePanelContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: BoxDecoration(
        color: AppColors.darkGrey,
        boxShadow: const [
          BoxShadow(color: AppColors.gridBlueGrey, offset: Offset(0, 10)),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_buildDotRow(), const SizedBox(height: 2), _buildDotRow()],
        ),
      ),
    );
  }

  Widget _buildDotRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (_) {
        return Container(
          width: 3.75,
          height: 3.75,
          margin: const EdgeInsets.symmetric(horizontal: 1.5),
          decoration: const BoxDecoration(
            color: AppColors.panelGrey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
