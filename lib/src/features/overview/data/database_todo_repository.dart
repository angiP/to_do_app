import 'package:to_do_app/src/features/overview/domain/todo.dart';

abstract class DatabaseTodoRepository {
  /// Fetches the list of all items from the database.
  Future<List<Todo>> fetchAllTodos();

  /// Fetches a single item by its ID from the database.
  Future<Todo?> fetchTodoById(int id);

  /// Inserts a new item into the database.
  Future<void> addTodo(Todo item);

  /// Updates an existing item in the database.
  Future<void> updateTodo(Todo item);

  /// Deletes an item from the database by its ID.
  Future<void> deleteTodo(int id);
}
