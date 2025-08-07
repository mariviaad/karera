import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/bloc/betting/betting_cubit.dart';
import 'package:karera/features/game/presentation/bloc/betting/betting_state.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BetAmountWidget extends StatefulWidget {
  const BetAmountWidget({super.key});

  @override
  State<BetAmountWidget> createState() => _BetAmountWidgetState();
}

class _BetAmountWidgetState extends State<BetAmountWidget> {
  void increment() {
    final current = context.read<BettingCubit>().state.betAmount;
    context.read<BettingCubit>().updateBetAmount(current + 1);
  }

  void decrement() {
    final current = context.read<BettingCubit>().state.betAmount;
    context.read<BettingCubit>().updateBetAmount(current > 0 ? current - 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BettingCubit, BettingState>(
      builder: (context, state) {
        final denomination = state.betAmount;
        final screenWidth = MediaQuery.of(context).size.width;

        // Responsive values based on screen width
        double containerHeight;
        double containerWidth;
        double tapWidth;
        double iconSize;
        double tapFontSize;
        double amountFontSize;
        double amountWidth;

        if (screenWidth <= 450) {
          // Small screen
          containerHeight = 36;
          containerWidth = 160;
          tapWidth = 58;
          iconSize = 10;
          tapFontSize = 10;
          amountFontSize = 11;
          amountWidth = 42;
        } else {
          // Large screen
          containerHeight = 48;
          containerWidth = 210;
          tapWidth = 70;
          iconSize = 12;
          tapFontSize = 12;
          amountFontSize = 14;
          amountWidth = 72;
        }

        return Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            color: const Color(0x801E2939),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF4A5565)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: tapWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  color: const Color(0xFF364153),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.settings,
                      color: Colors.white,
                      size: iconSize,
                      weight: 4,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Tap',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: tapFontSize,
                      ),
                    ),
                  ],
                ),
              ),
              _buildButton("−", onTap: decrement),
              Container(
                width: amountWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  border: const Border.symmetric(
                    vertical: BorderSide(width: 1, color: Color(0xFF4A5565)),
                  ),
                  color: AppColors.gameBackground,
                ),
                alignment: Alignment.center,
                child: Text(
                  '$denomination',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: amountFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildButton("+", onTap: increment),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton(String label, {required VoidCallback onTap}) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: const Size(24, 40.5),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 15.75,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(label),
    );
  }
}
