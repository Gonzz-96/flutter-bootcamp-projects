import 'package:flutter/material.dart';
import 'package:todoey_app/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({this.onNewTaskAdded});

  final Function onNewTaskAdded;

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final textFieldController = TextEditingController();

  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  void _onSubmit(String taskName) {
    final newTask = Task(name: textFieldController.text);
    widget.onNewTaskAdded(newTask);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(),
              textAlign: TextAlign.center,
              controller: textFieldController,
              onSubmitted: _onSubmit,
              // TextField widget has also a 'onChanged' attribute
            ),
            SizedBox(height: 20),
            FlatButton(
              onPressed: () {
                _onSubmit(textFieldController.text);
              },
              color: Colors.lightBlueAccent,
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
