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
  Subject.fromJson(Map<String, dynamic> json){
    name = json['name'];
    color = Color(json['color']);
  }
//member functions----------
  Map<String, dynamic> toJson() => {
    'name' : name,
    'color' : color.value,
  };

}

Subject defaultSubject = Subject(name: "Other", color: Colors.white);

//default subjects
List<Subject> subjects = [
  Subject(name: "Chores", color: Colors.grey),
  Subject(name: "Math", color: Colors.red),
  Subject(name: "English", color: Colors.green),
  Subject(name: "History", color: Colors.purple),
  Subject(name: "Science", color: Colors.orange),
];