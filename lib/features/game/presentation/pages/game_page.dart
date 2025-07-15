import 'package:flutter/material.dart';
import 'package:karera/features/game/presentation/widgets/counter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GamePage extends StatelessWidget {
  final String name;

  const GamePage({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SlidingUpPanel(
        panel: Container(color: Colors.blue, child: CounterWidget()),
        body: Container(color: Colors.grey, child: Text(name)),
      ),
    );
  }
}
