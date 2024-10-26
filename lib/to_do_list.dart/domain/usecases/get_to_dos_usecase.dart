import 'package:simple_to_do_app/to_do_list.dart/data/repository.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';

abstract class GetToDosUsecase {
  Future<List<ToDo>> call();
}

class GetToDosUsecaseImpl implements GetToDosUsecase {
  GetToDosUsecaseImpl(this.repository);

  final Repository repository;

  @override
  Future<List<ToDo>> call() async {
    return await repository.getToDos();
  }
}
