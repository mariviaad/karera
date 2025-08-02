class BettingState {
  final int betAmount;
  final List<List<int>> bettingGrid;
  final List<List<List<int>>> betHistory;

  const BettingState({
    required this.betAmount,
    required this.bettingGrid,
    required this.betHistory,
  });

  factory BettingState.initial() {
    return BettingState(
      betAmount: 1,
      bettingGrid: List.generate(6, (_) => List.filled(6, 0)),
      betHistory: [],
    );
  }

  BettingState copyWith({
    int? betAmount,
    List<List<int>>? bettingGrid,
    List<List<List<int>>>? betHistory,
  }) {
    return BettingState(
      betAmount: betAmount ?? this.betAmount,
      bettingGrid: bettingGrid ?? this.bettingGrid,
      betHistory: betHistory ?? this.betHistory,
    );
  }
}
