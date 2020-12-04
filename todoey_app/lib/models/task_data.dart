import 'package:flutter/foundation.dart';
import 'package:todoey_app/models/task.dart';

class TaskData extends ChangeNotifier {
  final tasks = <Task>[
    Task(name: 'Buy milk'),
    Task(name: 'Go tot the gym'),
    Task(name: 'Study new stuff about programming'),
  ];
}
