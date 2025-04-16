import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/common/async_value_widget.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/delete_todo_controller.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/get_todos_controller.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/update_todo_controller.dart';
import 'package:to_do_app/src/features/overview/presentation/todo_badge_widget.dart';
import 'package:to_do_app/src/utils/async_value_ui.dart';

class ToDoOverview extends ConsumerWidget {
  const ToDoOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch todos
    final todos = ref.watch(getTodosControllerProvider);
    return Center(
      child: AsyncValueWidget(
        value: todos,
        data: (todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoBadgeWidget(
                todo: todo,
                onTap: () {},
                // trailing: IconButton(
                //   icon: Icon(Icons.delete),
                //   onPressed:
                //       deleteTodoState.isLoading
                //           ? null
                //           : () async {
                //             final result = await ref
                //                 .read(deleteTodoControllerProvider.notifier)
                //                 .deleteTodo(todo.id!);

                //             if (result && context.mounted) {
                //               ScaffoldMessenger.of(context).showSnackBar(
                //                 const SnackBar(
                //                   content: Text('Todo added successfully'),
                //                   duration: Duration(seconds: 1),
                //                 ),
                //               );
                //             }
                //           },
                // ),
              );
            },
          );
        },
      ),
    );
  }
}
