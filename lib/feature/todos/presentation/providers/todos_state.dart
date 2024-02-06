import 'package:widget_tester/feature/todos/domain/todos_entity.dart';

class TodosState {
  final List<TodoEntity> todoList;
  TodosState({
    required this.todoList,
  });

  factory TodosState.init() {
    return TodosState(
      todoList: [],
    );
  }

  TodosState copyWith({
    List<TodoEntity>? todoList,
  }) {
    return TodosState(
      todoList: todoList ?? this.todoList,
    );
  }
}
