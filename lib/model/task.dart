class Task {
//member attributes---------  
  String name;
  String description;
  DateTime dueDate;
//constructors--------------
  Task({
    this.name,
    this.description,
    this.dueDate,
  });
//member functions----------

}

//fake db of tasks for testing purposes
List<Task> tasksDB = [
  Task(
    name: "Mobile Apps Creative 2",
    description: "Creative 2 for Mobile Apps",
    dueDate: DateTime.utc(2021, 3, 4),
  ),
  Task(
    name: "Government Discussion 4",
    description: "Post reaction to article and reply to 2 threads",
    dueDate: DateTime.utc(2021, 3, 2),
  ),
  Task(
    name: "Programming Languages p02",
    description: "Subset Pascal Parser",
    dueDate: DateTime.utc(2021, 3, 8),
  ),
];