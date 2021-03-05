import 'package:Lesson2Creative/model/task.dart';
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

  @override
  initState(){
    super.initState();
    con = _Controller(this);
  }

  void render(fn){
    setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task Manager")),
      floatingActionButton: FloatingActionButton( 
        onPressed: () => {
          Navigator.pushNamed(context, AddTaskScreen.routeName)
          .whenComplete(con.refresh)
        },
        child: Icon(Icons.add),
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          itemCount: tasksDB.length,
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
    return Container(
      color: tasksDB[index].subject.color,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(tasksDB[index].name),
        subtitle: Text(
          "Due: ${tasksDB[index].dueDate.month}/" +
          "${tasksDB[index].dueDate.day}/" +
          "${tasksDB[index].dueDate.year}"
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
    showDetails(context, tasksDB[index]);
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
      
      tasksDB.remove(task);
      Navigator.pop(context);
    });
  }
}