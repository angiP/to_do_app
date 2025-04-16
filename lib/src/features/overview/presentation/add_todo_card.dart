import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/features/overview/domain/todo.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/add_todo_controller.dart';
import 'package:to_do_app/src/utils/async_value_ui.dart';

class AddTodoCard extends ConsumerWidget {
  const AddTodoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(addTodoControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });
    final addTodoState = ref.watch(addTodoControllerProvider);
    // Text controller
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed:
                  addTodoState.isLoading
                      ? null
                      : () async {
                        // Create a new todo with a unique ID
                        final newTodo = Todo(
                          id: DateTime.now().millisecondsSinceEpoch,
                          title: titleController.text,
                          description: descriptionController.text,
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
              child: const Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
