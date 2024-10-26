import 'package:get_it/get_it.dart';
import 'package:simple_to_do_app/to_do_list.dart/data/repository.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/create_to_do_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/delete_to_do_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/get_to_dos_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/update_to_do_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/utils/adapters/shared_preferences_adapter.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<SharedPreferencesAdapter>(
      () => SharedPreferencesAdapterImpl());
  locator.registerLazySingleton<Repository>(() => RepositoryImpl());
  locator.registerLazySingleton<CreateToDoUsecase>(
    () => CreateToDoUsecaseImpl(
      locator<Repository>(),
    ),
  );
  locator.registerLazySingleton<DeleteToDoUsecase>(
    () => DeleteToDoUsecaseImpl(
      locator<Repository>(),
    ),
  );
  locator.registerLazySingleton<GetToDosUsecase>(
    () => GetToDosUsecaseImpl(
      locator<Repository>(),
    ),
  );
  locator.registerLazySingleton<UpdateToDoUsecase>(
    () => UpdateToDoUsecaseImpl(
      locator<Repository>(),
    ),
  );
}
