import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/new_task.dart';
import 'package:todo/widgets/todo_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String task;
  final List<ToDo> todos = [];

  void addNewTask(String task) {
    final tk = ToDo(task: task, date: DateTime.now(), flag: false);
    setState(() {
      todos.insert(0, tk);
    });
  }

  void startAddNewTask(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTask(addNewTask);
        });
  }

  void removeAllChecked() {
    setState(() {
      todos.removeWhere((element) => element.flag == true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'To-do List',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => startAddNewTask(context),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ToDoList(todos),
          Container(
              width: double.infinity,
              child: FlatButton(
                  onPressed: removeAllChecked,
                  child: Text('Remove Completed Task')))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () => startAddNewTask(context),
        backgroundColor: Colors.black,
      ),
    );
  }
}
