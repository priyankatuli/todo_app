
import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/data/services/todo_storage.dart';
import 'package:todo_app/presentation/ui/screens/all_todo_list_screen.dart';
import 'package:todo_app/presentation/ui/screens/done_todo_list_screen.dart';
import 'package:todo_app/presentation/ui/screens/new_todo_list_screen.dart';
import 'package:todo_app/presentation/ui/screens/undone_todo_list_screen.dart';

class TodoListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _TodoListScreenState();
  }
}

class _TodoListScreenState extends State<TodoListScreen>{

  List<TodoModel> _todoList = [];
  TodoStorage _todoStorage = TodoStorage();


  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){ //age build method call hobe tarpor setState call hobe
      _loadTodos();
      });


  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  title: Text('Todo List',style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),),
                  bottom: _buildTabBar(),
                ),
                body:TabBarView(children: [
                  AllTodoListScreen(
                      todoList: _todoList,
                      onDelete: (index){
                        _deleteTodos(index);
                      },
                      onStatusChange: (index){
                         _toggleStatusChange(index);
      }
                  ),
                  UndoneTodoListScreen(
                      todoList: _todoList.where((todo) => todo.isDone == false).toList(),
                      onDelete: (index){
                        _deleteTodos(index);
                      },
                      onStatusChange: (index){
                        _toggleStatusChange(index);
                      }
                  ),
                  DoneTodoListScreen(
                      todoList: _todoList.where((todo) =>todo.isDone == true).toList(), //only done todos
                      onDelete: (index){
                          _deleteTodos(index);
                      },
                      onStatusChange: (index){
                        _toggleStatusChange(index);
      }
                  ),

                ]),
                floatingActionButton: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)
                  ),
                   elevation: 3,
                    onPressed: () async{
                  await Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      NewTodoListScreen(onAddTodos: _onAddTodos)));

                },child: Icon(Icons.add,color: Colors.black54,size: 25,),),
      ),
    );
  }

TabBar _buildTabBar(){
    return TabBar(
      unselectedLabelColor: Colors.white,
      //indicatorWeight: 4,
      labelColor: Colors.black,
      indicatorColor: Colors.black54,
        tabs: [
          Tab(text: "All",),
          Tab(text: "Undone",),
          Tab(text: "Done",),
        ],
    );
}

void _onAddTodos(TodoModel todos){
  _todoList.add(todos);
  if(mounted){
    setState(() {
    });
  }
  ScaffoldMessenger.of(context).showSnackBar((SnackBar(duration: Duration(seconds: 1),content: Text('New Todo Added'))));
  _todoStorage.saveTodos(_todoList);
}

void _toggleStatusChange(int index){
     _todoList[index].isDone = !(_todoList[index].isDone);
      if(mounted){
        setState(() {});
      }
      _todoStorage.saveTodos(_todoList);
    }

void _deleteTodos(int index){
  _todoList.removeAt(index);
  if(mounted){
    setState(() {});
  }
  ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Delete Successfully'))));
      _todoStorage.saveTodos(_todoList);
    }

  Future<void> _loadTodos() async{
    try{
      final List<TodoModel>todos = await _todoStorage.readTodos();
      if(mounted){  //prevents setState on Un amounted widget
        setState(() {
          _todoList = todos;
        });
      }
    }catch(e){
       print('error shows: $e');
    }

  }
}