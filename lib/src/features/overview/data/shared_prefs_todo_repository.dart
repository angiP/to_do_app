import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/src/features/overview/data/database_todo_repository.dart';
import 'package:to_do_app/src/features/overview/domain/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_prefs_todo_repository.g.dart';

class SharedPrefsRepository implements DatabaseTodoRepository {
  final SharedPreferences prefs;
  static const String _key = 'todos';

  SharedPrefsRepository(this.prefs);

  Future<List<Todo>> _getStoredTodos() async {
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];
    final List decoded = json.decode(jsonString);
    return decoded.map((e) => Todo.fromJson(e)).toList();
  }

  Future<void> _saveTodos(List<Todo> todos) async {
    final jsonString = json.encode(todos.map((e) => e.toJson()).toList());
    await prefs.setString(_key, jsonString);
  }

  @override
  Future<void> addTodo(Todo item) async {
    final todos = await _getStoredTodos();
    todos.add(item);
    await _saveTodos(todos);
  }

  @override
  Future<void> updateTodo(Todo item) async {
    final todos = await _getStoredTodos();
    final index = todos.indexWhere((t) => t.id == item.id);
    if (index == -1) return;
    todos[index] = item;
    await _saveTodos(todos);
  }

  @override
  Future<void> deleteTodo(int id) async {
    final todos = await _getStoredTodos();
    todos.removeWhere((t) => t.id == id);
    await _saveTodos(todos);
  }

  @override
  Future<List<Todo>> fetchAllTodos() async {
    final jsonString = prefs.getString(_key);
    if (jsonString == null) return [];
    final List decoded = json.decode(jsonString);
    return decoded.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<Todo?> fetchTodoById(int id) async {
    final todos = await _getStoredTodos();
    return todos.firstWhere((t) => t.id == id);
  }
}

@Riverpod(keepAlive: true)
SharedPrefsRepository sharedPrefsTodoRepository(Ref ref) {
  final sharedPrefs = ref.watch(sharedPreferencesProvider);

  return SharedPrefsRepository(sharedPrefs);
}

final sharedPreferencesProvider = Provider<SharedPreferences>((_) {
  return throw UnimplementedError();
});
