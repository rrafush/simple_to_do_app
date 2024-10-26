import 'dart:convert';

import 'package:simple_to_do_app/locator.dart';
import 'package:simple_to_do_app/to_do_list.dart/data/model/to_do_model.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';
import 'package:simple_to_do_app/to_do_list.dart/utils/adapters/shared_preferences_adapter.dart';

abstract class Repository {
  Future<List<ToDo>> getToDos();
  Future<void> createToDo(ToDo toDo);
  Future<void> updateToDo(ToDo toDo);
  Future<void> deleteToDo(ToDo toDo);
}

class RepositoryImpl implements Repository {
  final SharedPreferencesAdapter _sharedPreferencesAdapter =
      locator<SharedPreferencesAdapter>();
  @override
  Future<List<ToDo>> getToDos() async {
    final data = await _sharedPreferencesAdapter.getData();
    return data.map((e) => ToDoModel.fromJson(e).toEntity()).toList();
  }

  @override
  Future<void> createToDo(ToDo toDo) async {
    await _sharedPreferencesAdapter.setData(
      toDo.id,
      ToDoModel.fromEntity(toDo).toJson(),
    );
  }

  @override
  Future<void> updateToDo(ToDo toDo) async {
    final data = ToDoModel.fromEntity(toDo).toJson();
    await _sharedPreferencesAdapter.removeData(toDo.id);
    await _sharedPreferencesAdapter.setData(toDo.id, data);
  }

  @override
  Future<void> deleteToDo(ToDo toDo) async {
    await _sharedPreferencesAdapter.removeData(toDo.id);
  }
}
