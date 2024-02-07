import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_tester/feature/todos/presentation/providers/todos_notifier_provider.dart';

class TodoInputFieldWidget extends ConsumerStatefulWidget {
  const TodoInputFieldWidget({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodoInputFieldWidgetState();
}

class _TodoInputFieldWidgetState extends ConsumerState<TodoInputFieldWidget> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: TextFormField(
            controller: _inputController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Add todo',
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            height: 35,
            width: 35,
            child: IconButton.filled(
              iconSize: 20,
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromRGBO(60, 118, 181, 1),
                ),
              ),
              onPressed: () {
                ref
                    .read(todosNotifierProvider.notifier)
                    .addTodo(message: _inputController.text);
                _inputController.clear();
              },
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
