import 'package:equatable/equatable.dart';

class Multiplier {
  static const int first = 6;
  static const int second = 5;
  static const int third = 4;
  static const int fourth = 3;
  static const int fifth = 2;
  static const int sixth = 1;
}

class BetItem extends Equatable {
  final int raceNum;
  final BetAmount betAmount;
  final ResultPlacing resultPlacing;
  final int totalBetAmount;

  const BetItem({
    required this.raceNum,
    required this.betAmount,
    required this.resultPlacing,
    required this.totalBetAmount,
  });

  factory BetItem.fromJson(Map<String, dynamic> json) {
    return BetItem(
      raceNum: json['raceNum'],
      betAmount: BetAmount.fromJson(json["betAmount"]),
      resultPlacing: ResultPlacing.fromJson(json["resultPlacing"]),
      totalBetAmount: json["totalBetAmount"] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
    raceNum,
    betAmount,
    resultPlacing,
    totalBetAmount,
  ];
}

class ResultPlacing extends Equatable {
  final int first;
  final int second;
  final int third;
  final int fourth;
  final int fifth;
  final int sixth;

  const ResultPlacing({
    required this.first,
    required this.second,
    required this.third,
    required this.fourth,
    required this.fifth,
    required this.sixth,
  });

  factory ResultPlacing.fromJson(Map<String, dynamic> json) {
    return ResultPlacing(
      first: json["first"],
      second: json["second"],
      third: json["third"],
      fourth: json["fourth"],
      fifth: json["fifth"],
      sixth: json["sixth"],
    );
  }

  Set<int> get resultNumbers => {first, second, third, fourth, fifth, sixth};

  Map<int, int> get resultWithMultiplier => {
    first: Multiplier.first,
    second: Multiplier.second,
    third: Multiplier.third,
    fourth: Multiplier.fourth,
    fifth: Multiplier.fifth,
    sixth: Multiplier.sixth,
  };

  @override
  List<Object?> get props => [first, second, third, fourth, fifth, sixth];
}

class BetAmount extends Equatable {
  final Map<int, int> betAmount;
  const BetAmount({required this.betAmount});
  factory BetAmount.fromJson(Map<String, dynamic> json) {
    return BetAmount(
      betAmount: json.map(
        (key, value) => MapEntry(int.parse(key), int.parse(value.toString())),
      ),
    );
  }
  int? amountFor(int number) => betAmount[number];
  Map<int, int> get placedBets =>
      Map.fromEntries(betAmount.entries.where((entry) => entry.value > 0));
  int get totalBetAmount =>
      betAmount.values.fold(0, (sum, value) => sum + value);
  Map<String, dynamic> toJson() {
    return betAmount.map((key, value) => MapEntry(key.toString(), value));
  }

  @override
  List<Object?> get props => [betAmount];
}

extension BetItemCalculations on BetItem {
  int get totalWinnings {
    int winnings = 0;
    final result = resultPlacing.resultWithMultiplier;
    for (final entry in betAmount.placedBets.entries) {
      final number = entry.key;
      final amount = entry.value;
      if (result.containsKey(number)) {
        winnings += amount * result[number]!;
      }
    }
    return winnings;
  }

  int get totalLosses {
    final resultNumbers = resultPlacing.resultNumbers;
    int losses = 0;
    for (final entry in betAmount.placedBets.entries) {
      final number = entry.key;
      final amount = entry.value;
      if (!resultNumbers.contains(number)) {
        losses += amount;
      }
    }
    return losses;
  }

  int get netAmount => totalWinnings - totalLosses;
}
