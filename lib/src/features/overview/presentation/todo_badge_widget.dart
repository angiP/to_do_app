import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/config/app_sizes.dart';
import 'package:to_do_app/src/features/overview/domain/todo.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/delete_todo_controller.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/update_todo_controller.dart';
import 'package:to_do_app/src/utils/async_value_ui.dart';

class TodoBadgeWidget extends ConsumerWidget {
  final Todo todo;
  final VoidCallback? onTap;

  const TodoBadgeWidget({super.key, required this.todo, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(deleteTodoControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });
    // Get the loading states

    final deleteTodoState = ref.watch(deleteTodoControllerProvider);
    final updateTodoState = ref.watch(updateTodoControllerProvider);

    return Padding(
      padding: EdgeInsets.all(Sizes.p8),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (DismissDirection direction) async {
          if (deleteTodoState.isLoading) return;

          final result = await ref
              .read(deleteTodoControllerProvider.notifier)
              .deleteTodo(todo.id!);

          if (result && context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Todo deleted successfully',
                ), // Also fixed the message
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        child: Card(
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Left icon/avatar section
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          todo.isDone
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primaryFixed,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      todo.isDone ? Icons.check_circle : Icons.list_alt,
                      color:
                          todo.isDone
                              ? Theme.of(context).colorScheme.primaryFixed
                              : Theme.of(context).colorScheme.primary,
                      size: 24,
                    ),
                  ),

                  // Center content
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            todo.description,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right action section
                  Checkbox(
                    value: todo.isDone,
                    onChanged: (newValue) {
                      if (updateTodoState.isLoading) return;

                      final updatedTodo = todo.copyWith(
                        isDone: newValue ?? false,
                      );

                      // Update the todo
                      ref
                          .read(updateTodoControllerProvider.notifier)
                          .updateTodo(updatedTodo)
                          .then((success) {
                            if (success && context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Todo updated successfully'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          });
                    },
                    activeColor: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
