class BettingState {
  final int betAmount;

  const BettingState({required this.betAmount});

  factory BettingState.initial() {
    return BettingState(betAmount: 1);
  }
  BettingState copyWith({int? betAmount}) {
    return BettingState(betAmount: betAmount ?? this.betAmount);
  }
}
