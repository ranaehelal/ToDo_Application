import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_item.dart';


class HomaPage extends StatefulWidget {
  const HomaPage({super.key});

  @override
  State<HomaPage> createState() => _HomaPageState();
}

class _HomaPageState extends State<HomaPage> {
  List<Task> tasks = [
    Task(name: "Watch the Tutorial", isCompleted: true),
    Task(name: "Do the exercise", isCompleted: false),
  ];
  void _addNewTask() {
    setState(() {
      tasks.add(Task(name: "New Task ${tasks.length + 1}", isCompleted: false));
    });
  }
  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTask();
        },
        backgroundColor: theme.colorScheme.primary,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: tasks.map((task) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: TaskItem(
                taskName: task.name,
                isCompleted: task.isCompleted,
                onChanged: (value) {
                  setState(() {
                    task.isCompleted = value!;
                  });
                },
                activeColor: theme.colorScheme.primary, // Pass the color

              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
