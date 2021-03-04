import 'package:Lesson2Creative/model/task.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget{
  static const routeName = "/addTaskScreen";
  @override
  State<StatefulWidget> createState() {
    return AddTaskState();
  }

}

class AddTaskState extends State<AddTaskScreen> {
  _Controller con;
  Task newTask;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  initState(){
    super.initState();
    con = _Controller(this);
    newTask = Task(
      name: "New Task", 
      description: "NewTask",
      dueDate: DateTime.utc(1970, 1, 1),
    );
  }

  void render(fn){
    setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Name", 
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      enabled: true,
                      initialValue: "New Task",
                      validator: null,
                      onSaved: null,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Description", 
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      enabled: true,
                      initialValue: "New Task",
                      validator: null,
                      onSaved: null,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Date Due: ", 
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Text("${newTask.dueDate.month}/" +
                          "${newTask.dueDate.day}/" +
                          "${newTask.dueDate.year}", 
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        FlatButton(
                          onPressed: con.setDate,
                          child: Text("Set Date"),
                        ),
                      ],
                    )
                  ),
                ],
              ),
              //submit button
              RaisedButton(
                child: Text("Add Task"),
                onPressed: con.addTask,
              ),
            ],    
          ),
        ),
      ),
    );
  }

}

class _Controller {
//member attributes--------------
  AddTaskState state;

//constructors-------------------
  _Controller(this.state);

//member functions---------------
  Future<void> setDate() async {
      final DateTime selectedDate = await showDatePicker(
        context: state.context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year, DateTime.now().month),
        lastDate: DateTime(3021),
      );    
      state.render((){
        if(selectedDate != null){
          state.newTask.dueDate = selectedDate;
        }
      });  
  }

  void addTask(){
    tasksDB.add(state.newTask);
    Navigator.pop(state.context);
  }
}