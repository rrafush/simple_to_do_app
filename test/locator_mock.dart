import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_to_do_app/to_do_list.dart/data/repository.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/create_to_do_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/delete_to_do_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/get_to_dos_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/update_to_do_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/utils/adapters/shared_preferences_adapter.dart';

class SharedPreferencesAdapterMock extends Mock
    implements SharedPreferencesAdapter {}

class RepositoryMock extends Mock implements Repository {}

class CreateToDoUsecaseMock extends Mock implements CreateToDoUsecase {}

class DeleteToDoUsecaseMock extends Mock implements DeleteToDoUsecase {}

class GetToDosUsecaseMock extends Mock implements GetToDosUsecase {}

class UpdateToDoUsecaseMock extends Mock implements UpdateToDoUsecase {}

GetIt locator = GetIt.instance;
void setupLocatorMock() {
  locator.registerLazySingleton<SharedPreferencesAdapter>(
    () => SharedPreferencesAdapterMock(),
  );
  locator.registerLazySingleton<Repository>(
    () => RepositoryMock(),
  );
  locator.registerLazySingleton<CreateToDoUsecase>(
    () => CreateToDoUsecaseMock(),
  );
  locator.registerLazySingleton<DeleteToDoUsecase>(
    () => DeleteToDoUsecaseMock(),
  );
  locator.registerLazySingleton<GetToDosUsecase>(
    () => GetToDosUsecaseMock(),
  );
  locator.registerLazySingleton<UpdateToDoUsecase>(
    () => UpdateToDoUsecaseMock(),
  );
}
