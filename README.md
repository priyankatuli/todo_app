# 📝 Todo App

This is a simple Todo App designed to help users keep track of their daily tasks efficiently.

## 🚀 Features

 ✅ **Create Tasks**
      - Add tasks with a title and description.
      - Automatically records the task creation time.

 🔁 **Update Task Status**
      - Easily mark tasks as **Done** or **Undone**

 🗑️ **Swipe to Delete**
      - Quickly remove tasks using the intuitive `Dismissible` widget.

 💾 **CSV-Based Data Storage**
     - Tasks are saved locally in a `.csv` file within the device's document directory.

## 📂 File Storage Location

   The `.csv` file is stored using the `path_provider` package in the app’s **application documents directory**, typically found in:
   Android: /data/data/<your.app.package.name>/app_flutter/files_name
   You can view this path using **Device Explorer** in Android Studio.