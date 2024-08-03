import 'package:equatable/equatable.dart';

final class ToDo extends Equatable {
  const ToDo({
    required this.id,
    required this.title,
    required this.description,
  });

  final String id;
  final String title;
  final String description;

  @override
  List<Object> get props => [
        id,
        title,
        description,
      ];
}
