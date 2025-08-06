part of 'current_bets_bloc.dart';

abstract class CurrentBetsState {}

class InitialCurrentBets extends CurrentBetsState {}

class CurrentBetsLoading extends CurrentBetsState {}

class CurrentBetsLoadingMore extends CurrentBetsState {
  final List<BetItem> betItems;

  CurrentBetsLoadingMore({required this.betItems});
}

class CurrentBetsLoaded extends CurrentBetsState {
  final List<BetItem> betItems;
  final int totalAmount;
  final int netAmount;

  CurrentBetsLoaded({
    required this.betItems,
    required this.totalAmount,
    required this.netAmount,
  });

  get raceNum => null;
}

class BetSuccessful extends CurrentBetsState {
  final List<BetItem> betItems;
  final int totalAmount;
  final int netAmount;

  BetSuccessful({
    required this.betItems,
    required this.totalAmount,
    required this.netAmount,
  });
}

class PlaceBetFailed extends CurrentBetsState {
  final List<BetItem> betItems;
  final String errorMessage;

  PlaceBetFailed({required this.betItems, required this.errorMessage});
}

class ErrorCurrentBets extends CurrentBetsState {
  final String errorMessage;

  ErrorCurrentBets({required this.errorMessage});
}
