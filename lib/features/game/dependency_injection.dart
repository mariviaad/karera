import 'package:karera/core/dependency_injection.dart';
import 'package:karera/core/services/api_client.dart';
import 'package:karera/features/game/data/repositories/result_repositories.dart';
import 'package:karera/features/game/presentation/bloc/race_history/race_hist_bloc.dart';

void setUpGameDependencies() {
  locator.registerLazySingleton<ResultRepositories>(
    () => ResultRepositories(locator<DioClient>()),
  );
  locator.registerFactory<ResultHistoryBloc>(
    () => ResultHistoryBloc(locator<ResultRepositories>()),
  );
}
