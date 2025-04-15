import 'package:flutter/material.dart';
import 'package:to_do_app/src/features/overview/data/database_todo_repository.dart';

class NewTodoCard extends StatefulWidget {
  final DatabaseTodoRepository dbRepo;
  final VoidCallback onTodoAdded;

  const NewTodoCard({
    super.key,
    required this.dbRepo,
    required this.onTodoAdded,
  });

  @override
  State<NewTodoCard> createState() => _NewTodoCardState();
}

class _NewTodoCardState extends State<NewTodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("Neue Aufgabe"),
          TextField(
            decoration: InputDecoration(
              labelText: "Aufgabe",
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Beschreibung",
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // await widget.dbRepo.insertItem(
              //   Todo(
              //     id: 1, // Hier solltest du sicherstellen, dass IDs korrekt vergeben werden
              //     title: "Aufgabe",
              //     description: "description",
              //     isCompleted: true,
              //   ),
              // );
              widget.onTodoAdded(); // Hier rufst du die Callback-Funktion auf
            },
            child: Text("Hinzufügen"),
          ),
        ],
      ),
    );
  }
}
