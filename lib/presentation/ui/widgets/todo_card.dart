import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/models/todo_model.dart';

class TodoCard extends StatefulWidget{

  TodoCard({super.key,required this.todo, required this.onIconButtonPressed});

  final TodoModel todo;
  //final VoidCallback onDelete;
  final VoidCallback onIconButtonPressed;


  @override
  State<StatefulWidget> createState() {
    return _TodoCardState();
  }
}

class _TodoCardState extends State<TodoCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: _getCardBgColor(widget.todo.isDone),
        elevation: 3,
        child: ListTile( //it provides internal padding
          title: Text(widget.todo.title ?? 'No Title Found', style:
          TextStyle( decoration: _isTextDecoration(widget.todo.isDone),
              fontSize: 17, fontWeight: FontWeight.bold),),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.todo.description ?? 'No Description found',
                  style: TextStyle(fontSize: 16,),),
                Text('Created at: ${formatDate(widget.todo.created_at)}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: widget.onDelete,
                              icon: Icon(Icons.delete_outline_outlined,
                                color: AppColors.black54,)),
                        ],
                      ),

                       */
          ]),
          trailing: _buildRoundedIconButton(widget.todo.isDone),

                  ),
    );
  }

  Widget _buildRoundedIconButton(bool isDone){
    print('TodoCard: $isDone'); ///false
    return GestureDetector(
      onTap: widget.onIconButtonPressed,
      child: CircleAvatar(
         child: Icon(_getIcon(!isDone)), //false = true;
      ),

    );
  }

  Color ? _getCardBgColor(bool isDone){
    print('BG: $isDone');
    return isDone ?  Colors.green.shade100 : Colors.white;

  }
  IconData ? _getIcon(bool isDone){
    print('Icon:$isDone');
    return isDone? Icons.hourglass_empty_sharp : Icons.check_box_rounded;
  }

 TextDecoration ? _isTextDecoration(bool isDone){
   print('Text: $isDone');
    return isDone ? TextDecoration.lineThrough : TextDecoration.none;
 }

  String ? formatDate(int ? date) {
    if (date == null) {
      return 'No Date';
    }
    try {
      DateTime utcDate = DateTime.fromMillisecondsSinceEpoch(date);
      return DateFormat('dd MMM yyyy, hh:mm a').format(utcDate); //format date
    } catch (e) {
      return 'Invalid Date';
    }
  }
}