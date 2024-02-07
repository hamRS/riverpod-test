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

  void addTodo({required String message}) {
    final TodoEntity todo = TodoEntity.add(
      message: message,
    );
    state = state.copyWith(
      todoList: [
        ...state.todoList,
        todo,
      ],
    );
  }

  Future<void> toggleTodo({required String id}) async {
    for (int i = 0; i < state.todoList.length; i++) {
      if (state.todoList[i].id == id) {
        List<TodoEntity> temp = state.todoList;
        temp[i] = temp[i].copyWith(isDone: !temp[i].isDone);
        state = state.copyWith(todoList: temp);
        break;
      }
    }
  }

  List<TodoEntity> getCompleted() {
    return state.todoList.where((element) => element.isDone).toList();
  }

  List<TodoEntity> getToBeCompleted() {
    return state.todoList.where((element) => !element.isDone).toList();
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
