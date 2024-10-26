import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_to_do_app/to_do_list.dart/data/model/to_do_model.dart';
import 'package:simple_to_do_app/to_do_list.dart/data/repository.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';
import 'package:simple_to_do_app/to_do_list.dart/utils/adapters/shared_preferences_adapter.dart';

import '../../locator_mock.dart';

void main() {
  late final SharedPreferencesAdapter sharedPreferencesAdapterMock;
  setUpAll(() {
    setupLocatorMock();
    sharedPreferencesAdapterMock = locator<SharedPreferencesAdapter>();
  });

  test(
      'when getToDos is called then it should call shared preferences returning data',
      () {
    when(() => sharedPreferencesAdapterMock.getData()).thenAnswer(
      (_) async => List<Map<String, dynamic>>.empty(),
    );

    final sut = RepositoryImpl();
    final result = sut.getToDos();
    expect(result, completes);

    verify(() => sharedPreferencesAdapterMock.getData()).called(1);
  });

  test(
      'when createToDo is called then it should call shared preferences with the right data',
      () {
    when(() => sharedPreferencesAdapterMock.setData(any(), any())).thenAnswer(
      (_) => Future.value(),
    );

    const todo = ToDo(id: '123', title: 'title', description: 'description');

    final sut = RepositoryImpl();
    final result = sut.createToDo(todo);
    expect(result, completes);

    final todoJson = ToDoModel.fromEntity(todo).toJson();

    verify(() => sharedPreferencesAdapterMock.setData('123', todoJson))
        .called(1);
  });

  test(
      'when updateToDo is called then it should call shared preferences deleting the old data and adding the new one',
      () {
    //ignore: unused_element
    fakeAsync(async) {
      when(() => sharedPreferencesAdapterMock.setData(any(), any())).thenAnswer(
        (_) => Future.value(),
      );
      when(() => sharedPreferencesAdapterMock.removeData(any())).thenAnswer(
        (_) => Future.value(),
      );

      const todo = ToDo(id: '123', title: 'title', description: 'description');

      final sut = RepositoryImpl();
      final result = sut.updateToDo(todo);
      expect(result, completes);

      async.elapse(const Duration(seconds: 1));
      final todoJson = ToDoModel.fromEntity(todo).toJson();

      verify(() => sharedPreferencesAdapterMock.removeData('123')).called(1);

      verify(() => sharedPreferencesAdapterMock.setData('123', todoJson))
          .called(1);
    }
  });

  test(
      'when deleteToDo is called then it should call shared preferences deleting the data',
      () {
    when(() => sharedPreferencesAdapterMock.removeData(any())).thenAnswer(
      (_) => Future.value(),
    );

    const todo = ToDo(id: '123', title: 'title', description: 'description');

    final sut = RepositoryImpl();
    final result = sut.deleteToDo(todo);
    expect(result, completes);

    verify(() => sharedPreferencesAdapterMock.removeData('123')).called(1);
  });
}
