import 'package:karera/features/game/data/models/bet_item.dart';

class BetItemRm {
  final List<BetItem> bets;
  final int totalAmount;

  const BetItemRm({required this.bets, required this.totalAmount});

  factory BetItemRm.fromJson(Map<String, dynamic> json) {
    return BetItemRm(
      bets:
          (json['bets'] as List<dynamic>?)
              ?.map((item) => BetItem.fromJson(item))
              .toList() ??
          [],
      totalAmount: json['total'] ?? 0,
    );
  }
}
