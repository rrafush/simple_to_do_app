part of 'to_do_bloc.dart';

sealed class ToDoEvent extends Equatable {
  const ToDoEvent();

  @override
  List<Object> get props => [];
}

class TodosLoadedRequested extends ToDoEvent {}

class TodoCreationRequested extends ToDoEvent {
  const TodoCreationRequested(
    this.title,
    this.description,
  );
  final String title;
  final String description;
}

class TodoUpdateRequested extends ToDoEvent {
  const TodoUpdateRequested(
    this.id,
    this.title,
    this.description,
  );
  final String id;
  final String title;
  final String description;
}

class TodoDeletionRequested extends ToDoEvent {
  const TodoDeletionRequested(this.id);
  final String id;
}
