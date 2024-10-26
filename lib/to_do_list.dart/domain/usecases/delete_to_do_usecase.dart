import 'package:simple_to_do_app/to_do_list.dart/data/repository.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';

abstract class DeleteToDoUsecase {
  Future<void> call(ToDo toDo);
}

class DeleteToDoUsecaseImpl implements DeleteToDoUsecase {
  DeleteToDoUsecaseImpl(this.repository);

  final Repository repository;

  @override
  Future<void> call(ToDo toDo) async {
    await repository.deleteToDo(toDo);
  }
}
