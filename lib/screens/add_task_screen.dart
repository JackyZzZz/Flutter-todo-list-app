import 'package:flutter/material.dart';
import '../services/database_service.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = TextEditingController();
    final db = DatabaseService();

    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(labelText: 'Task description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final task = taskController.text.trim();
                if (task.isNotEmpty) {
                  await db.addTask(task);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
