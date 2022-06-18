import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../modals/task.dart';

class TaskListProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'But eggs', isDone: true),
  ];

  List<Task> get getTaskList {
    return [..._tasks];
  }

  int get getTaskLength {
    return _tasks.length;
  }

  void addTask(String newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void toggleDone(Task taskToggle) {
    var actualTask =
        _tasks.firstWhere((element) => element.name == taskToggle.name);
    actualTask.isDone = !actualTask.isDone!;
    notifyListeners();
  }

  void deleteTask(Task taskToDelete) {
    _tasks.removeWhere((element) => element.name == taskToDelete.name);
    notifyListeners();
  }
}
