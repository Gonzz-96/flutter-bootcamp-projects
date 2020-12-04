import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:todoey_app/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  const TasksList({
    Key key,
  }) : super(key: key);

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> get tasks {
    return Provider.of<TaskData>(context).tasks;
  }

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
