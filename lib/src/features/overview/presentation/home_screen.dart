import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/common/async_value_widget.dart';
import 'package:to_do_app/src/features/overview/data/shared_prefs_todo_repository.dart';
import 'package:to_do_app/src/features/overview/domain/todo.dart';

import 'package:to_do_app/src/features/overview/presentation/controller/add_todo_controller.dart';
import 'package:to_do_app/src/features/overview/presentation/clear_all_button.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/delete_todo_controller.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/get_todos_controller.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/update_todo_controller.dart';
import 'package:to_do_app/src/utils/async_value_ui.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for errors in both controllers
    ref.listen<AsyncValue>(addTodoControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });

    ref.listen<AsyncValue>(updateTodoControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });

    ref.listen<AsyncValue>(deleteTodoControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });
    // Get the loading states
    final addTodoState = ref.watch(addTodoControllerProvider);
    final updateTodoState = ref.watch(updateTodoControllerProvider);
    final deleteTodoState = ref.watch(deleteTodoControllerProvider);

    // Fetch todos
    final todos = ref.watch(getTodosControllerProvider);

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Center(
                    child: AsyncValueWidget(
                      value: todos,
                      data: (todos) {
                        return ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            final todo = todos[index];
                            return ListTile(
                              title: Text(todo.title),
                              subtitle: Text(todo.description),
                              leading: Checkbox(
                                value: todo.isDone,
                                onChanged: (bool? newValue) {
                                  if (updateTodoState.isLoading) return;

                                  // Make sure we have the most current version of the todo
                                  final updatedTodo = todo.copyWith(
                                    isDone: newValue ?? false,
                                  );

                                  // Update the todo
                                  ref
                                      .read(
                                        updateTodoControllerProvider.notifier,
                                      )
                                      .updateTodo(updatedTodo)
                                      .then((success) {
                                        if (success && context.mounted) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                'Todo updated successfully',
                                              ),
                                              duration: Duration(seconds: 1),
                                            ),
                                          );
                                        }
                                      });
                                },
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed:
                                    deleteTodoState.isLoading
                                        ? null
                                        : () async {
                                          final result = await ref
                                              .read(
                                                deleteTodoControllerProvider
                                                    .notifier,
                                              )
                                              .deleteTodo(todo.id!);

                                          if (result && context.mounted) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Todo added successfully',
                                                ),
                                                duration: Duration(seconds: 1),
                                              ),
                                            );
                                          }
                                        },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Flexible(flex: 1, child: ClearAllButton()),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed:
                        addTodoState.isLoading
                            ? null
                            : () async {
                              // Create a new todo with a unique ID
                              final newTodo = Todo(
                                id: DateTime.now().millisecondsSinceEpoch,
                                title:
                                    'Todo ${DateTime.now().millisecondsSinceEpoch}',
                                description: 'Created at ${DateTime.now()}',
                                isDone: false,
                              );

                              final result = await ref
                                  .read(addTodoControllerProvider.notifier)
                                  .addTodo(newTodo);

                              if (result && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Todo added successfully'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }
                            },
                    child: const Text('Add Random Todo'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
