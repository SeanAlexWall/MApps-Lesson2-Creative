import 'package:Lesson2Creative/screens/task_manager.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  static const routeName = "/startScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Creative 2")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text(
                  "Task Manager",
                  style: Theme.of(context).textTheme.headline5,
                ),
                onPressed: () => 
                  Navigator.pushNamed(context, TaskManagerScreen.routeName)
              ),
            ],
          ),
        ),
      ),
    );
  }

}