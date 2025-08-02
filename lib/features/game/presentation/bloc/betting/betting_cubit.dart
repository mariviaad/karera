import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/features/game/presentation/bloc/betting/betting_state.dart';

class BettingCubit extends Cubit<BettingState> {
  BettingCubit() : super(BettingState.initial());

  void updateBetAmount(int betAmount) {
    emit(state.copyWith(betAmount: betAmount));
  }

  void incrementBetAmount() {
    emit(state.copyWith(betAmount: state.betAmount + 1));
  }

  void decrementBetAmount() {
    emit(state.copyWith(betAmount: state.betAmount - 1));
  }

  void clearBets() {
    final currentGrid = state.bettingGrid;

    final hasBets = currentGrid.any((row) => row.any((cell) => cell > 0));

    if (hasBets) {
      final newHistory = List<List<List<int>>>.from(state.betHistory)
        ..add(currentGrid.map((row) => List<int>.from(row)).toList());

      emit(state.copyWith(bettingGrid: _initialGrid(), betHistory: newHistory));
    } else {
      emit(state.copyWith(bettingGrid: _initialGrid()));
    }
  }

  List<List<int>> _initialGrid() {
    return List.generate(6, (_) => List.filled(6, 0));
  }
}
