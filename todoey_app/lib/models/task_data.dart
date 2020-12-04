import 'package:flutter/foundation.dart';
import 'package:todoey_app/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final _tasks = <Task>[
    Task(name: 'Buy milk'),
    Task(name: 'Go tot the gym'),
    Task(name: 'Study new stuff about programming'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addNewTask(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
  }

  int get tasksCount => _tasks.length;

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }
}
