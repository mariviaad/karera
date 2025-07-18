import 'package:flutter/material.dart';
import 'package:karera/features/game/presentation/widgets/balance_widget.dart';
import 'package:karera/features/game/presentation/widgets/bet_sliding_panel.dart';
import 'package:karera/features/game/presentation/widgets/game_panel_controller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GamePage extends StatelessWidget {
  final String name;
  const GamePage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: Text("Live Race Stream")),
          SlidingUpPanel(
            controller: _panelController,
            minHeight: height - (width * 0.71),
            maxHeight: height * 0.80,
            color: Colors.transparent,
            panelBuilder: (ScrollController sc) => Column(
              children: [
                const GamePanelContent(),
                const SizedBox(height: 1),
                BetSlidingPanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
