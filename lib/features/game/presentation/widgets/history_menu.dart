import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class HistoryMenu extends StatefulWidget {
  const HistoryMenu({super.key});

  @override
  HistoryMenuState createState() => HistoryMenuState();
}

class HistoryMenuState extends State<HistoryMenu> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 31.5,
      padding: width <= 1000
          ? EdgeInsets.symmetric(vertical: 10, horizontal: 8)
          : EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.buttonBlueGrey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(282.5, 30.5),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: Color.fromRGBO(69, 85, 108, 1),
            ),
            onPressed: () {},
            child: Text("Race History", style: TextStyle(fontSize: 12.25)),
          ),
        ],
      ),
    );
  }
}
