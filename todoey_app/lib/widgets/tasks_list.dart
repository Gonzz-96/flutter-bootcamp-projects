import 'package:flutter/material.dart';
import 'package:todoey_app/models/task.dart';
import 'package:todoey_app/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key key,
  }) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskTile(
          taskTitle: task.name,
          isChecked: task.isDone,
          checkBoxCallback: (newValue) {
            setState(() {
              task.isDone = newValue;
            });
          },
        );
      },
      itemCount: tasks.length,
    );
  }
}
