import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({
    Key key,
  }) : super(key: key);

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool _isChecked = false;

  void checkBoxCallback(bool newValue) {
    setState(() {
      _isChecked = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
            decoration: _isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
        isChecked: _isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  TaskCheckbox({this.isChecked, this.onChanged});

  final bool isChecked;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Colors.lightBlueAccent,
      onChanged: (newValue) {
        onChanged(newValue);
      },
    );
  }
}
