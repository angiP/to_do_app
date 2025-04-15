import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:to_do_app/src/features/overview/data/shared_prefs_todo_repository.dart';
import 'package:to_do_app/src/features/overview/presentation/controller/get_todos_controller.dart';

part 'delete_todo_controller.g.dart';

// This is the controller that will be used in the UI to delete a todo
// Just copy paste this boiler plate whenever you need a controller to WRITE stuff
@riverpod
class DeleteTodoController extends _$DeleteTodoController {
  Object? _key;
  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  Future<bool> deleteTodo(int index) async {
    state = const AsyncLoading();
    final key = _key;
    final newState = await AsyncValue.guard(() {
      return _deleteTodo(index);
    });
    if (key == _key) {
      state = newState;
    }

    if (!state.hasError) {
      ref.invalidate(getTodosControllerProvider);
    }

    return !state.hasError;
  }

  Future<void> _deleteTodo(int id) async {
    return ref.read(sharedPrefsTodoRepositoryProvider).deleteTodo(id);
  }
}
