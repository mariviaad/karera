import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/features/game/data/models/bet_item.dart';
import 'package:karera/features/game/data/repositories/bets_repository.dart';
import 'package:logger/logger.dart';

part 'current_bets_state.dart';
part 'current_bets_event.dart';

class CurrentBetsBloc extends Bloc<CurrentBetsEvent, CurrentBetsState> {
  final BetsRepository betsRepository;
  final logger = Logger();

  CurrentBetsBloc(this.betsRepository) : super(InitialCurrentBets()) {
    on<FetchCurrentBets>(_fetchBets);
    on<AddNewBet>(_addNewBet);
  }

  Future<void> _fetchBets(
    FetchCurrentBets event,
    Emitter<CurrentBetsState> emit,
  ) async {
    logger.i("Started fetching bets");
    emit(CurrentBetsLoading());
    try {
      final betItemRm = await betsRepository.getCurrentBets();
      logger.i("Fetched bets: ${betItemRm.bets.length}");
      final net = betItemRm.bets.fold(0, (sum, item) => sum + item.netAmount);

      emit(
        CurrentBetsLoaded(
          betItems: betItemRm.bets,
          totalAmount: betItemRm.totalAmount,
          netAmount: net,
        ),
      );
    } catch (error) {
      logger.e("Error fetching bets: $error");
      emit(ErrorCurrentBets(errorMessage: error.toString()));
    }
  }

  Future<void> _addNewBet(
    AddNewBet event,
    Emitter<CurrentBetsState> emit,
  ) async {
    final currentState = state;

    List<BetItem> oldData = [];
    int previousTotal = 0;

    if (currentState is CurrentBetsLoaded) {
      oldData = List.from(currentState.betItems);
      previousTotal = currentState.totalAmount;
    }

    emit(CurrentBetsLoadingMore(betItems: oldData));

    try {
      final placed = await betsRepository.placeBet(event.betItem);

      if (placed) {
        final updatedList = [event.betItem, ...oldData];
        final newTotal = previousTotal + event.betItem.totalBetAmount;
        final newNet = updatedList.fold(0, (sum, item) => sum + item.netAmount);

        emit(
          BetSuccessful(
            betItems: updatedList,
            totalAmount: newTotal,
            netAmount: newNet,
          ),
        );
      }
    } catch (error) {
      emit(PlaceBetFailed(betItems: oldData, errorMessage: error.toString()));
    }
  }
}
