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
}
