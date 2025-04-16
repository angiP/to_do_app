import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/features/overview/presentation/add_todo_card.dart';

import 'package:to_do_app/src/features/overview/presentation/clear_all_button.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/update_todo_controller.dart';
import 'package:to_do_app/src/features/overview/presentation/to_do_overview.dart';
import 'package:to_do_app/src/utils/async_value_ui.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen for errors in both controllers

    ref.listen<AsyncValue>(updateTodoControllerProvider, (_, state) {
      state.showAlertDialogOnError(context);
    });

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // Prevent keyboard from pushing up the UI
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Flexible(flex: 1, child: Text("GOOD MORNING")),
                Flexible(
                  flex: 2,
                  child: SizedBox(width: double.infinity, child: AddTodoCard()),
                ),
                Flexible(flex: 3, child: ToDoOverview()),
                const SizedBox(height: 20),
                Flexible(flex: 1, child: ClearAllButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
