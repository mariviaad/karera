import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/core/theme/constants/colors_const.dart';
import 'package:karera/features/game/presentation/bloc/race_history/race_hist_bloc.dart';
import 'package:karera/features/game/presentation/widgets/results_ball.dart';
import 'package:karera/utils/mocks.dart';

class RaceHistoryTable extends StatelessWidget {
  const RaceHistoryTable({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double fontSize = 12.25;
    double cellPadding = 6;
    double rowHeight = 45.5;

    if (screenWidth < 1000) {
      fontSize = 10.5;
      cellPadding = 4;
      rowHeight = 35;
    }

    final List<String> columnHeaders = [
      'Race #',
      '1st',
      '2nd',
      '3rd',
      '4th',
      '5th',
      '6th',
      'Status',
    ];

    return BlocBuilder<ResultHistoryBloc, ResultHistoryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.only(top: 12, end: 4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF45556C)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: columnHeaders.map((header) {
                      return Expanded(
                        child: Container(
                          height: rowHeight,
                          padding: EdgeInsets.all(cellPadding),
                          decoration: const BoxDecoration(
                            color: Color(0xFF314158),
                            border: Border(
                              right: BorderSide(color: Color(0xFF45556C)),
                              bottom: BorderSide(color: Color(0xFF45556C)),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              header,
                              style: TextStyle(
                                color: Color(0xFFCAD5E2),
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: (mockResults["results"] as List).length,
                    itemBuilder: (context, index) {
                      final results = mockResults["results"] as List;
                      final result = results[index] as Map<String, dynamic>;
                      final placing =
                          result["resultPlacing"] as Map<String, int>;
                      final statusValue = result["status"] == 1
                          ? const StatusText()
                          : Text(
                              "Finished",
                              style: TextStyle(
                                color: Color(0xFF99A1AF),
                                fontWeight: FontWeight.w700,
                                fontSize: fontSize,
                              ),
                            );
                      final rowValues = [
                        "#${result["raceNum"]}",
                        placing["first"],
                        placing["second"],
                        placing["third"],
                        placing["fourth"],
                        placing["fifth"],
                        placing["sixth"],
                        statusValue,
                      ];
                      return Row(
                        children: rowValues.asMap().entries.map((entry) {
                          final i = entry.key;
                          final value = entry.value;
                          return Expanded(
                            child: Container(
                              padding: EdgeInsets.all(cellPadding),
                              height: rowHeight,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: i != rowValues.length - 1
                                      ? const BorderSide(
                                          color: Color(0xFF45556C),
                                        )
                                      : BorderSide.none,
                                  bottom: index != results.length - 1
                                      ? const BorderSide(
                                          color: Color(0xFF45556C),
                                        )
                                      : BorderSide.none,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: i >= 1 && i <= 6
                                  ? ResultBall(number: value as int)
                                  : value is Widget
                                  ? value
                                  : Text(
                                      value.toString(),
                                      style: TextStyle(
                                        color: AppColors.white,
                                        fontSize: fontSize,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
