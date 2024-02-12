import 'package:widget_tester/feature/todos/domain/todos_entity.dart';

class TodosState {
  final List<TodoEntity> todoList;
  final List<TodoEntity> completedToDoList;
  final List<TodoEntity> needToDoList;
  TodosState(
      {required this.todoList,
      required this.needToDoList,
      required this.completedToDoList});

  factory TodosState.init() {
    return TodosState(
      todoList: [],
      needToDoList: [],
      completedToDoList: [],
    );
  }

  TodosState copyWith({
    List<TodoEntity>? todoList,
    List<TodoEntity>? completedToDoList,
    List<TodoEntity>? needToDoList,
  }) {
    return TodosState(
      todoList: todoList ?? this.todoList,
      needToDoList: needToDoList ?? this.needToDoList,
      completedToDoList: completedToDoList ?? this.completedToDoList,
    );
  }
}
