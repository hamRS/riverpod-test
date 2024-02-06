import 'package:flutter/material.dart';
import 'package:widget_tester/feature/todos/presentation/widgets/todo_checkbox_widget.dart';

class TodoListSectionWidget extends StatelessWidget {
  const TodoListSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
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
          TodoCheckboxWidget(
            onChecked: () {},
          ),
        ],
      ),
    );
  }
}
