import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/presentation/ui/widgets/todo_card.dart';

class UndoneTodoListScreen extends StatelessWidget{

  final List<TodoModel> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  UndoneTodoListScreen({super.key,
    required this.todoList,
    required this.onDelete,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context,int index){
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete_outline_outlined,color: Colors.white,),
              ),
              onDismissed: (_){
                onDelete(index);
              },
              child: TodoCard(todo: todoList[index],
                  //onDelete: ()=> onDelete(index),
                  onIconButtonPressed: (){
                      onStatusChange(index);
                  }
              ),
            );
          }
      ),
    );
  }

}