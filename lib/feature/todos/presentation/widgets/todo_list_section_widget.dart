import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_tester/feature/todos/presentation/providers/todos_notifier_provider.dart';
import 'package:widget_tester/feature/todos/presentation/widgets/todo_checkbox_widget.dart';

class TodoListSectionWidget extends StatelessWidget {
  const TodoListSectionWidget({
    super.key,
  });

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
            Consumer(
              builder: (context, ref, child) {
                final todosProvider = ref.watch(todosNotifierProvider);

                ref.listen(todosNotifierProvider, (previous, next) {
                  print(
                      'Todos completed new length ${next.completedToDoList.length}');
                  print('Todos need new length ${next.needToDoList.length}');
                });

                print('GetCompleted called again');
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TodoCheckboxWidget(
                      defaultValue: false,
                      onChecked: () async {
                        await ref
                            .read(todosNotifierProvider.notifier)
                            .toggleTodo(
                                id: todosProvider.needToDoList[index].id);
                      },
                      onDelete: () {
                        ref.read(todosNotifierProvider.notifier).removeTodo(
                            id: todosProvider.needToDoList[index].id);
                      },
                      todoLegend: todosProvider.needToDoList[index].message,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: todosProvider.needToDoList.length,
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'DONE',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Consumer(
              builder: (context, ref, child) {
                final todosProvider = ref.watch(todosNotifierProvider);

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TodoCheckboxWidget(
                      defaultValue: true,
                      onChecked: () async {
                        ref.read(todosNotifierProvider.notifier).toggleTodo(
                            id: todosProvider.completedToDoList[index].id);
                      },
                      onDelete: () {
                        ref.read(todosNotifierProvider.notifier).removeTodo(
                            id: todosProvider.completedToDoList[index].id);
                      },
                      todoLegend:
                          todosProvider.completedToDoList[index].message,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
                  itemCount: todosProvider.completedToDoList.length,
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
