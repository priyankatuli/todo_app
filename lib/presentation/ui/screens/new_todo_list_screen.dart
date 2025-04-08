import 'package:flutter/material.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/presentation/ui/utils/app_colors.dart';

class NewTodoListScreen extends StatefulWidget{
  final Function(TodoModel) onAddTodos;

  const NewTodoListScreen({super.key, required this.onAddTodos});

  @override
  State<StatefulWidget> createState() {
     return _NewTodoListScreenState();
  }
}

class _NewTodoListScreenState extends State<NewTodoListScreen>{

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: AppColors.themeColor2,
         foregroundColor: AppColors.whiteColor,
         title: Text('New Todo List',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
         ),),
       ),
       body: SingleChildScrollView(
           child: Padding(
             padding: EdgeInsets.all(16.0),
             child: Form(
               key: _formKey,
               child: Column(
                 children: [
                   TextFormField(
                     controller: _titleTEController,
                     keyboardType: TextInputType.text,
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     decoration: InputDecoration(
                       hintText: 'Title',
                       labelText: 'Title'
                     ),
                     validator: (String ? value){
                       if(value==null || value.trim().isEmpty){
                         return 'Enter the title';
                       }
                       return null;
                     },
                   ),
                   const SizedBox(height: 13,),
                   TextFormField(
                     controller: _descriptionTEController,
                     maxLines: 4,
                     keyboardType: TextInputType.text,
                     autovalidateMode: AutovalidateMode.onUserInteraction,
                     decoration: InputDecoration(
                         hintText: 'Description',
                         //labelText: 'Description'
                     ),
                     validator: (String ? value){
                       if(value == null || value.trim().isEmpty){
                         return 'Enter the Description';
                       }
                       return null;
                     },
                   ),
                   const SizedBox(height: 13,),
                   ElevatedButton(onPressed: (){
                     if(_formKey.currentState!.validate()){
                       //create a new TodoModel instance
                       TodoModel newTodo = TodoModel(
                         title: _titleTEController.text.trim(),
                         description: _descriptionTEController.text.trim(),
                         created_at: DateTime.now().millisecondsSinceEpoch,
                         isDone: false /// new tasks aren't completed yet
                       );
                       widget.onAddTodos(newTodo);
                       Navigator.pop(context);
                     }
                   }, child : Icon(Icons.add,size: 20,)),
                 ],
               ),
             ),
           ),
         ),
       );
  }

}