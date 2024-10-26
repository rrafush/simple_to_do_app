import 'package:equatable/equatable.dart';
import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';

final class ToDoModel extends Equatable {
  const ToDoModel({
    required this.id,
    required this.title,
    required this.description,
  });

  final String id;
  final String title;
  final String description;

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  factory ToDoModel.fromEntity(ToDo toDo) => ToDoModel(
        id: toDo.id,
        title: toDo.title,
        description: toDo.description,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };

  ToDo toEntity() => ToDo(
        id: id,
        title: title,
        description: description,
      );

  @override
  String toString() {
    return 'ToDoModel{id: $id, title: $title, description: $description}';
  }

  @override
  List<Object> get props => [
        id,
        title,
        description,
      ];
}
