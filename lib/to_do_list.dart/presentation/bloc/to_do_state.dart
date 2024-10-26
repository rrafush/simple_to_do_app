part of 'to_do_bloc.dart';

sealed class ToDoState extends Equatable {
  const ToDoState({
    this.toDos = const [],
  });

  final List<ToDo> toDos;

  @override
  List<Object> get props => [
        toDos,
      ];
}

final class ToDoInitial extends ToDoState {}

final class ToDoLoadInProgress extends ToDoState {}

final class ToDoLoadSuccess extends ToDoState {
  const ToDoLoadSuccess({
    super.toDos,
  });
}

final class ToDoLoadFailure extends ToDoState {
  const ToDoLoadFailure({
    required this.message,
  });
  final String message;
}

final class ToDosUpdatedSuccess extends ToDoState {}
