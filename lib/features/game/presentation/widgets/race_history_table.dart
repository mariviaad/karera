import 'package:flutter/material.dart';

class RaceHistoryTable extends StatelessWidget {
  const RaceHistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> columnHeaders = [
      'Race #',
      '1st',
      '2nd',
      '3rd',
      '4th',
      '5th',
      '6th',
    ];
    final List<String> rowHeaders = [
      '#1000',
      '#999',
      '#998',
      '#997',
      '#996',
      '#995',
      '#994',
      '#993',
      '#992',
      '#991',
    ];

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 12, end: 4),
      child: Table(
        border: TableBorder.all(
          color: const Color(0xFF45556C),
          borderRadius: BorderRadius.circular(10),
        ),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        defaultColumnWidth: const IntrinsicColumnWidth(flex: .90),
        children: List.generate(11, (rowIndex) {
          if (rowIndex == 0) {
            return TableRow(
              children: List.generate(columnHeaders.length, (colIndex) {
                final bool isTopLeft = colIndex == 0;
                final bool isTopRight = colIndex == columnHeaders.length - 1;

                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: isTopLeft
                        ? const Radius.circular(10)
                        : Radius.zero,
                    topRight: isTopRight
                        ? const Radius.circular(10)
                        : Radius.zero,
                  ),
                  child: ColoredBox(
                    color: const Color(0xFF314158),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          columnHeaders[colIndex],
                          style: const TextStyle(
                            color: Color(0xFFCAD5E2),
                            fontWeight: FontWeight.bold,
                            fontSize: 10.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          }
          return TableRow(
            children: List.generate(columnHeaders.length, (colIndex) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    colIndex == 0 ? rowHeaders[rowIndex - 1] : 'abcd',
                    style: const TextStyle(
                      color: Color(0xFFCAD5E2),
                      fontWeight: FontWeight.bold,
                      fontSize: 10.5,
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }
}
