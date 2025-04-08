import 'dart:core';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/data/models/todo_model.dart';

class TodoStorage{

  //get the file to store CSV file
  Future<File> _getCsvFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/todos.csv');
  }

  //saving todos CSV file means writing data to the file
 Future<void> saveTodos(List<TodoModel> todos) async {
   try {
     File file = await _getCsvFile();
     List<List<dynamic>> csvData = [
       ['id', 'title', 'description', 'created_at', 'isDone'],
       ...todos.map((todo) {
         print('Saving: ${todo.title}, isDone: ${todo.isDone}');
   return [
   todo.id,
   todo.title,
   todo.description,
   todo.created_at,
   todo.isDone ? 'true' : 'false' //a nullable expression can't be use a condition
   ];
   }),
     ];
     await file.writeAsString(ListToCsvConverter().convert(csvData));
   } catch (e) {
     print('Error Loading csv: $e');
   }
 }

  //read todos from the csv file//get the csv file

Future<List<TodoModel>> readTodos () async {
  try {
    File file = await _getCsvFile();
    if (await file.exists()) {
      String csvData = await file.readAsString();
      List<List<dynamic>> rows = CsvToListConverter().convert(csvData);
      //return rows.skip(1).map((row) {
      List<TodoModel> todos = rows.skip(1).map((row) {
        bool isDoneValue = row[4].toString().trim().toLowerCase() == 'true';
        print('Todo: ${row[1]}, isDone: ${row[4]} -> Parsed: $isDoneValue');

        return TodoModel(
          id: row[0].toString(), //id
          title:row[1].toString(), //title
          description: row[2].toString(), //description
          created_at: int.parse(row[3].toString()),  //created at
          isDone: isDoneValue
        );
      }).toList();
      return todos;
    } else {
      return [];
    }
  } catch (e) {
    print('Error loading error : $e');
    return [];
  }
}
/*
//import todos from Json
  Future<void> importFromJson(String jsonData) async{
    List<dynamic> jsonTodos = jsonDecode(jsonData);
    List<TodoModel> todos = jsonTodos.map((todo) => TodoModel.fromJson(todo)).toList();
    // Save imported todos to CSV
    await saveTodos(todos);


  }

 */
}