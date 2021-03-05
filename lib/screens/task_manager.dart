import 'dart:convert';

import 'package:Lesson2Creative/model/task.dart';
import 'package:Lesson2Creative/model/tasklist.dart';
import 'package:Lesson2Creative/screens/addtask_screen.dart';
import 'package:flutter/material.dart';

class TaskManagerScreen extends StatefulWidget{
  static const routeName = "/taskManagerScreen";
  @override
  State<StatefulWidget> createState() {
    return TaskManagerState();
  }

}

class TaskManagerState extends State<TaskManagerScreen> {
  _Controller con;
  TaskList taskList;
  
  @override
  initState(){
    super.initState();
    con = _Controller(this);
    taskList = TaskList();
  }

  void render(fn){
    setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    taskList.getTasks();

    return Scaffold(
      appBar: AppBar(title: Text("Task Manager")),
      floatingActionButton: FloatingActionButton( 
        onPressed: () => {
          Navigator.pushNamed(context, AddTaskScreen.routeName, arguments: taskList)
          .whenComplete((){
            taskList.saveTasks();
            con.refresh();
          })
        },
        child: Icon(Icons.add),
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: taskList.tasks.length,
          itemBuilder: con.getTasks,
        ),
        onRefresh: con.refresh,
      )
    );
  }

}

class _Controller {
//member attributes--------------
  TaskManagerState state;

//constructors-------------------
  _Controller(this.state);

//member functions---------------
  Widget getTasks(BuildContext context, int index){
    print("getTasks");
    return Container(
      color: state.taskList.tasks[index].subject.color,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(state.taskList.tasks[index].name),
        subtitle: Text(
          "Due: ${state.taskList.tasks[index].dueDate.month}/" +
          "${state.taskList.tasks[index].dueDate.day}/" +
          "${state.taskList.tasks[index].dueDate.year}"
        ),
        onTap: (){
          _onTap(context, index);
        },
      ),
    );
  }

  Future<void> refresh(){
    //just rebuilds the screen
    return Future.delayed(Duration(seconds: 0), (){
      state.render((){
        print("refresh");
      });
    });
  }

  void _onTap(BuildContext context, int index){
    showDetails(context, state.taskList.tasks[index]);
  }

  void showDetails(BuildContext context, Task task){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: Text(task.name),
        actions: [
          FlatButton(
            color: Colors.blue,
            child: Text("Complete"),
            onPressed: () => deleteTask(context, task),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.delete_forever_outlined),
            onPressed: () => deleteTask(context, task),
            color: Colors.red,
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () => print("edit"),
            color: Colors.blue,
          ),
        ],
        content: Card(
          elevation: 0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(task.description),
                    )
                  ]
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(task.subject.name),
                    )
                  ]
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Due: ${task.dueDate.month}/" +
                        "${task.dueDate.day}/" +
                        "${task.dueDate.year}"
                      ),
                    ),
                  ]
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

  void deleteTask(BuildContext context, Task task){
    state.render((){
      
      state.taskList.tasks.remove(task);
      state.taskList.saveTasks();
      Navigator.pop(context);
    });
  }
}