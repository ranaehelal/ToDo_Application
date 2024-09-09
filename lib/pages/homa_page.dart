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

  void _addNewTask(String taskName) {
    setState(() {
      tasks.add(Task(name: "${taskName}", isCompleted: false));
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
          String taskName = "";

          showDialog(context: context, builder: (context){
            return AlertDialog(
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Task", style: TextStyle(fontSize: 24,color: Color(0xff4f378b), fontWeight: FontWeight.w500,),),
                  SizedBox(height: 4), // Space between title and divider
                  Divider( // Line between title and content
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ],
              ),

              content: TextField(
                onChanged: (value) {
                  taskName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Task',
                  labelStyle: TextStyle(color: theme.colorScheme.secondary),
                  filled: true,
                  fillColor: Colors.white, // Background color of the TextField
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary, // Border color when enabled
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    borderSide: BorderSide(
                      color: theme.colorScheme.secondary, // Border color when focused
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (taskName.isNotEmpty) {
                      _addNewTask(taskName);
                    }
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(
                    "OK",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); },
                  child: Text("Cancel", style: TextStyle(color: theme.colorScheme.secondary)),),
              ],

            );
          });
          //_addNewTask();
        },
        backgroundColor: theme.colorScheme.primary,
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: tasks.isEmpty
            ? Center(  // If tasks is empty, display a message
          child: Text(
            "No tasks added",  // Message displayed when there are no tasks
            style: TextStyle(
              color: theme.colorScheme.secondary,
              fontSize: 20,
            ),
          ),
        ) :
        ListView.builder(
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
