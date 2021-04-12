import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  final Function addNewTask;
  NewTask(this.addNewTask);
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final taskController = TextEditingController();

  void submitData() {
    final enteredTask = taskController.text;
    if (enteredTask.isEmpty) return;
    widget.addNewTask(enteredTask);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: TextField(
          controller: taskController,
          onSubmitted: (_) => submitData(),
        ),
      ),
    );
  }
}
