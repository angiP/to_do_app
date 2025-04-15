import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/src/features/overview/data/shared_prefs_todo_repository.dart';
import 'package:to_do_app/src/features/overview/domain/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_todos_controller.g.dart';

@riverpod
Future<List<Todo>> getTodosController(Ref ref) {
  return ref.read(sharedPrefsTodoRepositoryProvider).fetchAllTodos();
}
