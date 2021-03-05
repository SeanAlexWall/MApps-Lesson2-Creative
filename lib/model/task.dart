import 'package:Lesson2Creative/model/subject.dart';

class Task {
//member attributes---------  
  String name;
  String description;
  DateTime dueDate;
  Subject subject;
//constructors--------------
  Task({
    this.name,
    this.description,
    this.dueDate,
    this.subject,
  });
  Task.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    dueDate = DateTime.parse(json['dueDate']);
    subject = Subject.fromJson(json['subject']);
  }
//member functions----------
  Map<String, dynamic> toJson() => {
    'name' : name,
    'description' : description,
    'dueDate' : dueDate.toString(),
    'subject' : subject.toJson(),
  };
}

//fake db of tasks for testing purposes
List<Task> tasksDB = [
  Task(
    name: "Pgs 152-153 problems 3-23 odd",
    description: "Polynomial Long Division",
    dueDate: DateTime.utc(2021, 3, 4),
    subject: subjects[subjects.indexWhere((e) => e.name == "Math")],
  ),
  Task(
    name: "Government Discussion 4",
    description: "Post reaction to article and reply to 2 threads",
    dueDate: DateTime.utc(2021, 3, 2),
    subject: subjects[subjects.indexWhere((e) => e.name == "History")],
  ),
  Task(
    name: "Persuasive Essay 2",
    description: "UGGGH ESSAY :(",
    dueDate: DateTime.utc(2021, 3, 8),
    subject: subjects[subjects.indexWhere((e) => e.name == "English")],
  ),
  Task(
    name: "Lab Report 3-7",
    description: "Kinetic Energy Lab Report",
    dueDate: DateTime.utc(2021, 3, 7),
    subject: subjects[subjects.indexWhere((e) => e.name == "Science")],
  ),
  Task(
    name: "Tidy Room",
    description: "",
    dueDate: DateTime.utc(2021, 3, 5),
    subject: subjects[subjects.indexWhere((e) => e.name == "Chores")],
  ),
];