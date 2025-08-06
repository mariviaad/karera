import 'package:karera/core/dependency_injection.dart';
import 'package:karera/core/services/api_client.dart';
import 'package:karera/features/game/data/repositories/bets_repository.dart';
import 'package:karera/features/game/data/repositories/result_repository.dart';
import 'package:karera/features/game/presentation/bloc/current_bets/current_bets_bloc.dart';
import 'package:karera/features/game/presentation/bloc/result_history/result_hist_bloc.dart';

void setUpGameDependencies() {
  locator.registerLazySingleton<ResultRepository>(
    () => ResultRepository(locator<DioClient>()),
  );
  locator.registerFactory<ResultHistoryBloc>(
    () => ResultHistoryBloc(locator<ResultRepository>()),
  );
  locator.registerLazySingleton<BetsRepository>(
    () => BetsRepository(locator<DioClient>()),
  );
  locator.registerFactory<CurrentBetsBloc>(
    () => CurrentBetsBloc(locator<BetsRepository>()),
  );
}
