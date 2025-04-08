import 'package:flutter/material.dart';
import 'package:todo_app/presentation/ui/screens/all_todo_list_screen.dart';
import 'package:todo_app/presentation/ui/screens/todo_list_screen.dart';


import 'presentation/ui/utils/app_colors.dart';

class TodoApp extends StatelessWidget{
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Todo App',
       debugShowCheckedModeBanner: false,
         home: TodoListScreen(),
       themeMode: ThemeMode.system,
       theme: _lightThemeData(),
     );
  }

  ThemeData _lightThemeData(){
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.enableColor
          )
        ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.focusedColor
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.focusErrorColor
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 1,
                  color: AppColors.errorColor
              )
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff21BF73),
          foregroundColor: Colors.white,
          fixedSize: Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          )
        )
      ),
floatingActionButtonTheme: FloatingActionButtonThemeData(
)
    );
  }

}