import 'package:uuid/uuid.dart';

class TodoEntity {
  final String message;
  final bool isDone;
  final String id;

  TodoEntity({
    required this.message,
    required this.isDone,
    required this.id,
  });

  TodoEntity copyWith({
    String? message,
    bool? isDone,
    String? id,
  }) {
    return TodoEntity(
      message: message ?? this.message,
      isDone: isDone ?? this.isDone,
      id: id ?? this.id,
    );
  }

  factory TodoEntity.empty() {
    return TodoEntity(
      message: '',
      isDone: false,
      id: const Uuid().v4(),
    );
  }

  factory TodoEntity.add({required String message}) {
    return TodoEntity(
      message: message,
      isDone: false,
      id: const Uuid().v4(),
    );
  }
}
