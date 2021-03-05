import 'dart:convert';
import 'dart:io';

import 'package:Lesson2Creative/model/task.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pubx/pubx.dart';

class TaskList {
//member attributes---------  
  List<Task> tasks;
//constructors--------------
  TaskList(){
    tasks = [];
  }
//member functions----------
  Future<File> saveTasks() async{
    final file = await getLocalFile('taskList.json');
    String stringBuilder = "";
    for(int i = 0; i < tasks.length; i++){
      print("STRINGBUILDER==============================================");
      Map toEncode = tasks[i].toJson();
      stringBuilder += jsonEncode(toEncode);
      print("STRINGBUILDER2=============================================");
      stringBuilder += '\n';
    }
    print("BEFORE FILE OPEN +++++++++++++++++++++++++++++++++++++++++++++");
    return file.writeAsString(stringBuilder);
  }

  Future<void> getTasks() async{
    List<Task> newList = [];
    try{
      final file = await getLocalFile('taskList.json');
      Stream<String> lines = file.openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter());
      try{
        await for (var line in lines){
            Map taskMap = jsonDecode(line);
            print(line);
            newList.add(Task.fromJson(taskMap));
        }
        tasks = newList;
      }
      catch(e){
        print ("ERROR: $e");
      }
    }
    catch(e){
      print(e.toString());
      return;
    }
  }
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    print("PATH=============${directory.path}");
    return directory.path;
  }

  Future<File>  getLocalFile(fileName) async {
    final path = await _localPath;
    print('$path/$fileName');
    return File('$path/$fileName');
  }
}