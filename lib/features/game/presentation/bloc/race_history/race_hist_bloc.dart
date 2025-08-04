import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karera/features/game/data/models/result.dart';
import 'package:karera/features/game/data/repositories/result_repositories.dart';

part 'race_hist_state.dart';
part 'race_hist_event.dart';

class ResultHistoryBloc extends Bloc<ResultHistoryEvent, ResultHistoryState> {
  final ResultRepositories resultsRepository;
  ResultHistoryBloc(this.resultsRepository) : super(InitialResultHistory()) {
    on<FetchResultHistory>(_fetchBets);
  }

  void _fetchBets(FetchResultHistory event, emit) async {
    emit(ResultHistoryLoading());
    try {
      final results = await resultsRepository.fetchRaceHistory();
      emit(
        ResultHistoryLoaded(resultList: results.results, total: results.total),
      );
    } catch (error) {
      emit(ErrorResultHistory(errorMessage: error.toString()));
    }
  }
}
