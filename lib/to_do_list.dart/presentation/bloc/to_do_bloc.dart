import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_to_do_app/locator.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/create_to_do_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/delete_to_do_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/get_to_dos_usecase.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/usecases/update_to_do_usecase.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  ToDoBloc() : super(ToDoInitial()) {
    on<TodosLoadedRequested>(_mapTodosLoadedRequested);
  }

  final createToDoUsecase = locator<CreateToDoUsecase>();
  final getToDosUsecase = locator<GetToDosUsecase>();
  final updateToDoUsecase = locator<UpdateToDoUsecase>();
  final deleteTodoUsecase = locator<DeleteToDoUsecase>();

  Future<void> _mapTodosLoadedRequested(
    TodosLoadedRequested event,
    Emitter<ToDoState> emit,
  ) async {
    emit(ToDoLoadInProgress());
    try {
      final toDos = await getToDosUsecase();
      emit(ToDoLoadSuccess(toDos: toDos));
    } catch (error) {
      emit(ToDoLoadFailure(message: error.toString())); //TODO: improve message
    }
  }
}
