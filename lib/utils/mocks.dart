import 'dart:math';

final random = Random();

final mockResults = {
  "results": List.generate(100, (index) {
    final placements = List.generate(6, (i) => i + 1)..shuffle(random);
    return {
      "raceNum": 100 - index,
      "resultPlacing": {
        "first": placements[0],
        "second": placements[1],
        "third": placements[2],
        "fourth": placements[3],
        "fifth": placements[4],
        "sixth": placements[5],
      },
      "status": index == 0 ? 1 : 0,
    };
  }),
  "total": 10,
};

Map<String, dynamic> get mockBets {
  int overallTotal = 0;

  final bets = List.generate(100, (index) {
    final raceNum = 100 - index;

    // Generate random result placing (6 unique ball/placement pairs)
    final numbers = List.generate(6, (i) => i + 1)..shuffle(random);
    final resultPlacing = <String, int>{};
    final placementNames = [
      "first",
      "second",
      "third",
      "fourth",
      "fifth",
      "sixth",
    ];

    for (int i = 0; i < 6; i++) {
      final number = numbers[i]; // Ball number 1–6
      final placement = i + 1; // Placement 1st to 6th (column)
      final cellIndex = (number - 1) * 6 + placement; // 1–36
      resultPlacing[placementNames[i]] = cellIndex;
    }

    // Generate random number of bets between 1 and 8
    final betCount = random.nextInt(8) + 1;
    final availableCells = List.generate(36, (i) => i + 1)..shuffle(random);
    final betNumbers = <int, int>{};

    for (int i = 0; i < betCount; i++) {
      betNumbers[availableCells[i]] = (random.nextInt(5) + 1) * 10; // 10–50
    }

    final totalBetAmount = betNumbers.values.fold(0, (a, b) => a + b);
    overallTotal += totalBetAmount;

    return {
      "raceNum": raceNum,
      "betAmount": {for (int i = 1; i <= 36; i++) "$i": betNumbers[i] ?? 0},
      "resultPlacing": resultPlacing,
      "totalBetAmount": totalBetAmount,
      "totalWinnings": _calculateWinnings(betNumbers, resultPlacing),
      "totalLosses": _calculateLosses(betNumbers, resultPlacing),
      "netAmount":
          _calculateWinnings(betNumbers, resultPlacing) -
          _calculateLosses(betNumbers, resultPlacing),
      "created_at": DateTime.now()
          .subtract(Duration(minutes: index * 5))
          .toIso8601String(),
    };
  });

  return {"bets": bets, "total": overallTotal};
}

int _calculateWinnings(Map<int, int> bets, Map<String, int> results) {
  final multipliers = {
    "first": 6,
    "second": 5,
    "third": 4,
    "fourth": 3,
    "fifth": 2,
    "sixth": 1,
  };

  int winnings = 0;

  bets.forEach((cellIndex, amount) {
    for (var entry in results.entries) {
      if (entry.value == cellIndex) {
        winnings += amount * multipliers[entry.key]!;
        break;
      }
    }
  });

  return winnings;
}

int _calculateLosses(Map<int, int> bets, Map<String, int> results) {
  int losses = 0;

  bets.forEach((cellIndex, amount) {
    if (!results.containsValue(cellIndex)) {
      losses += amount;
    }
  });

  return losses;
}
