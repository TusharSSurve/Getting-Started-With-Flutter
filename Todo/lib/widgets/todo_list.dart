import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:intl/intl.dart';

class ToDoList extends StatefulWidget {
  final List<ToDo> todos;

  ToDoList(this.todos);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 104;
    return Container(
      height: height,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              elevation: 5,
              child: CheckboxListTile(
                activeColor: Colors.black,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  widget.todos[index].task,
                  style: TextStyle(
                      decoration: widget.todos[index].flag == true
                          ? TextDecoration.lineThrough
                          : null,
                      color: widget.todos[index].flag == true
                          ? Colors.grey
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Created on ' +
                      DateFormat.yMd()
                          .add_jm()
                          .format(widget.todos[index].date),
                  style: TextStyle(
                      decoration: widget.todos[index].flag == true
                          ? TextDecoration.lineThrough
                          : null,
                      color: widget.todos[index].flag == true
                          ? Colors.grey
                          : Colors.black),
                ),
                value: widget.todos[index].flag,
                onChanged: (bool value) {
                  setState(() {
                    widget.todos[index].flag = value;
                    ToDo td = widget.todos[index];
                    widget.todos.remove(td);
                    if (value)
                      widget.todos.add(td);
                    else
                      widget.todos.insert(0, td);
                  });
                },
              ));
        },
        itemCount: widget.todos.length,
      ),
    );
  }
}
