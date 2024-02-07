import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_tester/feature/todos/domain/todos_entity.dart';
import 'package:widget_tester/feature/todos/presentation/providers/todos_notifier_provider.dart';
import 'package:widget_tester/feature/todos/presentation/widgets/widgets.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  static const routeName = "/todos";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 241, 245, 1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const TodoInputFieldWidget(),
              ),
              const Divider(
                color: Color.fromRGBO(236, 241, 245, 1),
                height: 50,
              ),
              Consumer(
                builder: (context, ref, child) {
                  ref.watch(todosNotifierProvider);
                  final List<TodoEntity> completed =
                      ref.read(todosNotifierProvider.notifier).getCompleted();
                  final toBeCompleted = ref
                      .read(todosNotifierProvider.notifier)
                      .getToBeCompleted();

                  return TodoListSectionWidget(
                    completed: completed,
                    toBeCompleted: toBeCompleted,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
