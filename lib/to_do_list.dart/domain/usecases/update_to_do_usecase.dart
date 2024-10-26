import 'package:simple_to_do_app/to_do_list.dart/data/repository.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';

abstract class UpdateToDoUsecase {
  Future<void> call(ToDo toDo);
}

class UpdateToDoUsecaseImpl implements UpdateToDoUsecase {
  UpdateToDoUsecaseImpl(this.repository);

  final Repository repository;

  @override
  Future<void> call(ToDo toDo) async {
    await repository.updateToDo(toDo);
  }
}
