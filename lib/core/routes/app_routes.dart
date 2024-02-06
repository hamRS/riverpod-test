import 'package:go_router/go_router.dart';
import 'package:widget_tester/feature/todos/presentation/screen/todo_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TodosScreen(),
    ),
  ],
);
