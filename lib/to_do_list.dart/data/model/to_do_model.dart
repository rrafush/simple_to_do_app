import 'package:simple_to_do_app/to_do_list.dart/domain/entity/to_do.dart';

final class ToDoModel {
  ToDoModel({
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
}
