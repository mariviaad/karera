import 'package:get_it/get_it.dart';
import 'package:karera/core/services/api_client.dart';
import 'package:karera/features/game/dependency_injection.dart';

final locator = GetIt.instance;

void setUpDependencies() async {
  locator.registerLazySingleton<DioClient>(
    () => DioClient(baseUrl: 'local host'),
  );
  setUpGameDependencies();
}
