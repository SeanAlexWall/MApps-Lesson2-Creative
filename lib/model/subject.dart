import 'package:flutter/Material.dart';

class Subject {
//member attributes---------  
  String name;
  Color color;
//constructors--------------
  Subject({
    this.name,
    this.color,
  });
//member functions----------
}


//default subjects
List<Subject> subjects = [
  Subject(name: "Chores", color: Colors.grey),
  Subject(name: "Math", color: Colors.red),
  Subject(name: "English", color: Colors.green),
  Subject(name: "History", color: Colors.purple),
  Subject(name: "Science", color: Colors.orange),
];