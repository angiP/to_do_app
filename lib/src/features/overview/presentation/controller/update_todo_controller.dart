import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_app/src/features/overview/data/shared_prefs_todo_repository.dart';
import 'package:to_do_app/src/features/overview/domain/todo.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/get_todos_controller.dart';
part 'update_todo_controller.g.dart';

// This is the controller that will be used in the UI to add a todo
// Just copy paste this boiler plate whenever you need a controller to WRITE stuff
@riverpod
class UpdateTodoController extends _$UpdateTodoController {
  Object? _key;
  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  Future<bool> updateTodo(Todo todo) async {
    state = const AsyncLoading();
    final key = _key;
    final newState = await AsyncValue.guard(() {
      return _updateTodo(todo);
    });
    if (key == _key) {
      state = newState;
    }
    if (!state.hasError) {
      ref.invalidate(getTodosControllerProvider);
    }
    return !state.hasError;
  }

  Future<void> _updateTodo(Todo todo) async {
    return ref.read(sharedPrefsTodoRepositoryProvider).updateTodo(todo);
  }
}
