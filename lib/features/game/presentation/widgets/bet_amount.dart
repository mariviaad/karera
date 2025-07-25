import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BetAmountWidget extends StatefulWidget {
  const BetAmountWidget({super.key});

  @override
  State<BetAmountWidget> createState() => _BetAmountWidgetState();
}

class _BetAmountWidgetState extends State<BetAmountWidget> {
  int denomination = 1;

  void increment() => setState(() => denomination++);
  void decrement() =>
      setState(() => denomination = denomination > 0 ? denomination - 1 : 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.5,
      width: 185.2,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(30, 41, 57, .50),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF4A5565)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: 60,
            height: 40.5,
            decoration: BoxDecoration(
              color: const Color(0xFF364153),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Row(
              children: const [
                Icon(
                  LucideIcons.settings,
                  color: Colors.white,
                  size: 10.5,
                  weight: 4,
                ),
                SizedBox(width: 6),
                Text(
                  'Tap',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.5,
                  ),
                ),
              ],
            ),
          ),

          _buildButton("−", onTap: decrement),

          Container(
            width: 64,
            decoration: BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 1, color: Color(0xFF4A5565)),
              ),
              color: AppColors.gameBackground,
            ),
            alignment: Alignment.center,
            child: Text(
              '$denomination',
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 12.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          _buildButton("+", onTap: increment),
        ],
      ),
    );
  }

  Widget _buildButton(String label, {required VoidCallback onTap}) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: const Size(35, 40.5),
        padding: EdgeInsets.symmetric(horizontal: 10),
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
