import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:widget_tester/feature/todos/domain/todos_entity.dart';
import 'package:widget_tester/feature/todos/presentation/providers/todos_state.dart';

part 'todos_notifier_provider.g.dart';

@riverpod
class TodosNotifier extends _$TodosNotifier {
  @override
  TodosState build() {
    return TodosState.init();
  }

  void addTodo({required TodoEntity todo}) {
    state = state.copyWith(
      todoList: [
        ...state.todoList,
        todo,
      ],
    );
  }

  void removeTodo({
    required String id,
  }) {
    state = state.copyWith(
      todoList: state.todoList
        ..removeWhere(
          (element) => element.id == id,
        ),
    );
  }
}
