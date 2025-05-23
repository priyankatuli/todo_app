# 📝 Todo App

This is a simple Todo App designed to help users keep track of their daily todos efficiently.

## 🚀 Features

 ✅ **Create Tasks**
      - Add tasks with a title and description.
      - Automatically records the task creation time.

 🔁 **Update Todo Status**
      - Easily mark todos as **Done** or **Undone**

 🗑️ **Swipe to Delete**
      - Quickly remove todos using the intuitive `Dismissible` widget.

 💾 **CSV-Based Data Storage**
     - Todos are saved locally in a `.csv` file within the device's document directory.

## 📂 File Storage Location

   The `.csv` file is stored using the `path_provider` package in the app’s **application documents directory**, typically found in:
   Android: /data/data/<your.app.package.name>/app_flutter/files_name. You can view this path using **Device Explorer** in Android Studio.

## Why use CSV instead of Database
   - Simple to use, Lightweight
   - Human readable,open it (Notepad,Excel)
   - No need for complex database setup

## Installation
   
## Git Clone
    git clone https://github.com/priyankatuli/todo_app.git

## Flutter Version Management
    fvm use
    
## Pub Get
    flutter pub get
   
## Build APK
    flutter build apk

## Tech Stack
- Flutter
- Dart

## Screenshots

1. TodoList: 
Displays all todos categorized into All, Undone, and Done.

   ![TodoList](assets/images/todolist.png)
   
3. Create New Todo: Users can add a new todo with a title and description.

   ![New Todo](assets/images/new_todo.png)
   
5. Completed Todos or not: Visually shows which todos are marked as done or undone.

   ![Undone](assets/images/undone.png)             ![Done](assets/images/done.png)

