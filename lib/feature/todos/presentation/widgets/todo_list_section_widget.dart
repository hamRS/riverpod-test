import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_tester/feature/todos/domain/todos_entity.dart';
import 'package:widget_tester/feature/todos/presentation/providers/todos_notifier_provider.dart';
import 'package:widget_tester/feature/todos/presentation/widgets/todo_checkbox_widget.dart';

class TodoListSectionWidget extends StatelessWidget {
  const TodoListSectionWidget({
    super.key,
    required this.completed,
    required this.toBeCompleted,
  });

  final List<TodoEntity> toBeCompleted;
  final List<TodoEntity> completed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TO DO',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Consumer(
                      builder: (context, ref, child) {
                        ref.watch(todosNotifierProvider);
                        return TodoCheckboxWidget(
                          defaultValue: toBeCompleted[index].isDone,
                          onChecked: () async {
                            await ref
                                .read(todosNotifierProvider.notifier)
                                .toggleTodo(id: toBeCompleted[index].id);
                          },
                          onDelete: () {
                            ref
                                .read(todosNotifierProvider.notifier)
                                .removeTodo(id: toBeCompleted[index].id);
                          },
                          todoLegend: toBeCompleted[index].message,
                        );
                      },
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                itemCount: toBeCompleted.length),
            const SizedBox(
              height: 40,
            ),
            Text(
              'DONE',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Consumer(
                      builder: (context, ref, child) {
                        ref.watch(todosNotifierProvider);
                        return TodoCheckboxWidget(
                          defaultValue: completed[index].isDone,
                          onChecked: () async {
                            await ref
                                .read(todosNotifierProvider.notifier)
                                .toggleTodo(id: completed[index].id);
                          },
                          onDelete: () {
                            ref
                                .read(todosNotifierProvider.notifier)
                                .removeTodo(id: completed[index].id);
                          },
                          todoLegend: completed[index].message,
                        );
                      },
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                itemCount: completed.length),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
