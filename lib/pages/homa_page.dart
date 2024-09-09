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
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            final task = tasks[index];

            return Column(
              children: [
                Dismissible(
                  key: Key(task.name),
                  direction: DismissDirection.endToStart, // Swipe right to left
                  onDismissed: (direction) {
                    _removeTask(index);

                  },
                  background: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerRight, // Align icon to the right
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Icon(Icons.delete, color: Colors.white), // Delete icon
                  ),

                  child: TaskItem(
                    taskName: task.name,
                    isCompleted: task.isCompleted,
                    onChanged: (value) {
                      setState(() {
                        task.isCompleted = value!;
                      });
                    },
                    activeColor: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
