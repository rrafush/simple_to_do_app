import 'package:get_it/get_it.dart';
import 'package:simple_to_do_app/to_do_list.dart/data/repository.dart';
import 'package:simple_to_do_app/to_do_list.dart/utils/adapters/shared_preferences_adapter.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SharedPreferencesAdapter>(() => SharedPreferencesAdapterImpl());
  locator.registerLazySingleton<Repository>(() => RepositoryImpl());
}
