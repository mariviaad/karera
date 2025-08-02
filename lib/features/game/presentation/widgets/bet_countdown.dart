import 'dart:async';
import 'package:flutter/material.dart';

class BetCountdown extends StatefulWidget {
  final VoidCallback onCountdownFinish;
  const BetCountdown({super.key, required this.onCountdownFinish});

  @override
  State<BetCountdown> createState() => _BetCountdownState();
}

class _BetCountdownState extends State<BetCountdown> {
  int secondsLeft = 60;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          widget.onCountdownFinish();
          secondsLeft = 60;
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromRGBO(231, 0, 11, 1),
        border: Border.all(
          color: const Color.fromRGBO(251, 44, 54, 1),
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          "$secondsLeft",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
