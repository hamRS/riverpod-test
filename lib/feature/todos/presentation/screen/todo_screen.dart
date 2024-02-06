import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_tester/feature/todos/presentation/widgets/widgets.dart';

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  static const routeName = "/todos";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
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
              child: TodoInputfieldWidget(
                onPressed: () {},
              ),
            ),
            Divider(
              color: Color.fromRGBO(236, 241, 245, 1),
              height: 50,
            ),
            TodoListSectionWidget(),
          ],
        ),
      ),
    );
  }
}
