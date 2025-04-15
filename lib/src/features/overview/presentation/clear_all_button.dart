import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/features/overview/data/shared_prefs_todo_repository.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/get_todos_controller.dart';

class ClearAllButton extends ConsumerWidget {
  const ClearAllButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      onPressed: () async {
        // Get the SharedPreferences instance
        final prefs = ref.read(sharedPreferencesProvider);

        // Clear all data (you can also use prefs.clear() to clear everything in SharedPreferences)
        await prefs.remove('todos');

        // Refresh the todos list
        ref.invalidate(getTodosControllerProvider);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('All todos cleared'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: const Text('Clear All Todos'),
    );
  }
}
