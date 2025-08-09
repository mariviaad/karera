import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/bloc/betting/betting_cubit.dart';
import 'package:karera/features/game/presentation/widgets/bet_sliding_panel.dart';
import 'package:karera/features/game/presentation/widgets/game_panel_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BettingCubit>(
      create: (_) => BettingCubit(),
      child: const GamePageView(),
    );
  }
}

class GamePageView extends StatefulWidget {
  const GamePageView({super.key});

  @override
  State<GamePageView> createState() => _GamePageViewState();
}

class _GamePageViewState extends State<GamePageView> {
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: (width <= 1000)
          ? SlidingUpPanel(
              controller: _panelController,
              minHeight: height - (width * 0.71),
              maxHeight: height * 0.8,
              color: Colors.transparent,
              panelBuilder: (ScrollController sc) => Builder(
                builder: (context) {
                  return Column(
                    children: [
                      const GamePanelContent(),
                      const SizedBox(height: 1),
                      Expanded(child: BetSlidingPanel()),
                    ],
                  );
                },
              ),

              body: const Center(
                child: Text(
                  "Live Race Stream",
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Live Race Stream",
                      style: TextStyle(color: AppColors.white, fontSize: 24),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: height),
                        child: BetSlidingPanel(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
