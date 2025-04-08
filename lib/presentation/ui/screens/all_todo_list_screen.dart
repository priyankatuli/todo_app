import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/presentation/ui/widgets/todo_card.dart';

class AllTodoListScreen extends StatelessWidget {
  final List<TodoModel> todoList;
  final Function(int) onDelete;
  final Function(int) onStatusChange;

  const AllTodoListScreen({super.key, required this.todoList, required this.onDelete, required this.onStatusChange});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
         direction: DismissDirection.endToStart,
         background: Container(
           color: Colors.red,
           alignment: Alignment.centerRight,
           padding: EdgeInsets.symmetric(horizontal: 20),
           child: Icon(Icons.delete_outline_outlined,color: Colors.grey.shade200,),
         ),
         onDismissed: (_){
            onDelete(index);
         },
          child: TodoCard(
           todo: todoList[index],
            //onDelete: ()=> onDelete(index),
            onIconButtonPressed: (){
               onStatusChange(index);
            },
          ),
        );
      },
    );
  }
}
