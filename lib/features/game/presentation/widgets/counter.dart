import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  @override
  State<CounterWidget> createState() {
    // TODO: implement createState
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Container(color: Colors.amber, width: width * .3),
          SizedBox(width: 10),
          Container(color: Colors.amber, width: 100),
          Text("$count"),
          TextButton(
            onPressed: () {
              setState(() {
                count++;
              });
            },
            child: Text("increment"),
          ),
        ],
      ),
    );
  }
}
