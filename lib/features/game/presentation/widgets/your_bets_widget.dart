import 'package:flutter/material.dart';
import 'package:karera/core/theme/constants/colors_const.dart';

class YourBets extends StatelessWidget {
  final int raceNumber;
  final bool isWin;
  final List<List<int?>> betGrid;
  final List<List<bool?>> resultGrid;
  final int totalBet;
  final int totalWin;
  final int totalLost;
  final List<dynamic> betItems; // placeholder if unused

  const YourBets({
    super.key,
    required this.raceNumber,
    required this.isWin,
    required this.betGrid,
    required this.resultGrid,
    required this.totalBet,
    required this.totalWin,
    required this.totalLost,
    required this.betItems,
  });

  @override
  Widget build(BuildContext context) {
    final colors = [
      AppColors.ballRed,
      AppColors.ballBlue,
      AppColors.ballGreen,
      AppColors.ballYellow,
      AppColors.ballViolet,
      AppColors.ballOrange,
    ];

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF162033),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.hoverGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ---- TEXT HEADER ----
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Race #$raceNumber',
                        style: const TextStyle(
                          fontSize: 12.25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isWin
                              ? const Color(0x1805DF72)
                              : const Color(0x18FF6467),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          isWin ? 'Won' : 'Lost',
                          style: TextStyle(
                            color: isWin
                                ? AppColors.textGreen
                                : const Color(0xFFFF6467),
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Total Bet: ₱$totalBet',
                        style: const TextStyle(
                          color: AppColors.yellow,
                          fontSize: 12.25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${isWin ? '+' : '-'}₱${isWin ? totalWin : totalLost}',
                        style: TextStyle(
                          color: isWin ? AppColors.textGreen : Colors.redAccent,
                          fontSize: 12.25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: const [
                  Text(
                    'Your Bets:',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' Gold = Race Result',
                    style: TextStyle(
                      color: AppColors.yellow,
                      fontSize: 10.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 6),

          /// ---- TABLE HEADER + GRID ----
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 210, // 7 columns x 30px
                child: Column(
                  children: [
                    Row(
                      children: const [
                        _TableHeader(label: 'B/P'),
                        _TableHeader(label: '1st'),
                        _TableHeader(label: '2nd'),
                        _TableHeader(label: '3rd'),
                        _TableHeader(label: '4th'),
                        _TableHeader(label: '5th'),
                        _TableHeader(label: '6th'),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Table(
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      children: List.generate(6, (rowIndex) {
                        final ballNumber = rowIndex + 1;
                        final ballColor = colors[rowIndex % colors.length];
                        final textColor = ballColor == AppColors.ballYellow
                            ? AppColors.black
                            : AppColors.white;

                        return TableRow(
                          children: [
                            /// BALL LABEL
                            Container(
                              width: 28,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFF314158),
                                border: Border.all(color: AppColors.hoverGrey),
                              ),
                              margin: const EdgeInsets.all(1),
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ballColor,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "$ballNumber",
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            /// BET CELLS
                            for (int col = 0; col < 6; col++)
                              _BetCell(
                                amount: betGrid[rowIndex][col],
                                isWinningResult: resultGrid[rowIndex][col],
                              ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ---- INLINE TABLE HEADER CELL ----
class _TableHeader extends StatelessWidget {
  final String label;

  const _TableHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    final isBP = label.toUpperCase() == 'B/P';

    return Container(
      width: 28,
      height: 21,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isBP ? const Color(0xFF1D293D) : const Color(0xFF314158),
        border: Border.all(color: AppColors.hoverGrey),
      ),
      margin: const EdgeInsets.all(1),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

/// ---- INLINE GRID CELL ----
class _BetCell extends StatelessWidget {
  final int? amount;
  final bool? isWinningResult;

  const _BetCell({required this.amount, required this.isWinningResult});

  @override
  Widget build(BuildContext context) {
    final bool isBetPlaced = amount != null;

    final Color backgroundColor = isWinningResult == true
        ? const Color(0x66FE9A00)
        : isBetPlaced
        ? const Color(0x33FB2C36)
        : const Color(0x33000000);

    final Color borderColor = isWinningResult == true
        ? const Color(0xFFFFB900)
        : isBetPlaced
        ? const Color(0xFFFB2C36)
        : const Color(0xFF45556C);

    return Container(
      width: 28,
      height: 28,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Center(
        child: isBetPlaced
            ? Text(
                '$amount',
                style: const TextStyle(
                  fontSize: 12.25,
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
