import 'package:simple_to_do_app/locator.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';
import 'package:simple_to_do_app/to_do_list.dart/utils/adapters/shared_preferences_adapter.dart';

abstract class Repository {
  Future<List<ToDo>> getToDos();
  Future<void> createToDo(ToDo toDo);
  Future<void> updateToDo(ToDo toDo);
  Future<void> deleteToDo(ToDo toDo);
}

class RepositoryImpl implements Repository {

  final SharedPreferencesAdapter _sharedPreferencesAdapter = locator<SharedPreferencesAdapter>();
  @override
  Future<List<ToDo>> getToDos() {
    // TODO: implement getToDos
    throw UnimplementedError();
  }

  @override
  Future<void> createToDo(ToDo toDo) {
    // TODO: implement addToDo
    throw UnimplementedError();
  }

  @override
  Future<void> updateToDo(ToDo toDo) {
    // TODO: implement updateToDo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteToDo(ToDo toDo) {
    // TODO: implement deleteToDo
    throw UnimplementedError();
  }
}
