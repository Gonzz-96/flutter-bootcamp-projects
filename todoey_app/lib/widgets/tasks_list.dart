import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';
import 'package:todoey_app/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      final tasks = taskData.tasks;
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = tasks[index];
          return GestureDetector(
            onLongPress: () {
              taskData.removeTask(task);
            },
            child: TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkBoxCallback: (newValue) {
                taskData.updateTask(task);
              },
            ),
          );
        },
        itemCount: tasks.length,
      );
    });
  }
}
