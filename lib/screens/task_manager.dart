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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Task Manager", style: Theme.of(context).textTheme.headline5,),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class _Controller {
//member attributes--------------
  TaskManagerState state;

//constructors-------------------
  _Controller(this.state);

//member functions---------------

}