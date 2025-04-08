import 'package:flutter/material.dart';
import 'package:todo_app/presentation/ui/utils/app_colors.dart';

AppBar CommonAppbar(context){
  return AppBar(
    backgroundColor: AppColors.themeColor2,
    foregroundColor: AppColors.whiteColor,
    title: Text('Todo List',
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    ),
  );
}