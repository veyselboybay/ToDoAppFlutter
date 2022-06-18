import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/modals/task.dart';
import 'package:todoey/providers/task_list_provider.dart';
import './tasks_tile.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListProvider>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemBuilder: ((context, index) {
            return TaskTile(
              isChecked: tasks.getTaskList[index].isDone,
              title: tasks.getTaskList[index].name,
              checkboxCallback: (checkboxState) {
                setState(() {
                  tasks.toggleDone(tasks.getTaskList[index]);
                });
              },
              longPressCallback: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              tasks.deleteTask(tasks.getTaskList[index]);
                              Navigator.of(context).pop();
                            },
                            child: Text('Yes'),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              primary: Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('No'),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                              primary: Colors.white,
                            ),
                          ),
                        ],
                        title: const Text('Do you want to delete the task?'),
                      );
                    });
              },
            );
          }),
          itemCount: tasks.getTaskLength,
        );
      },
    );
  }
}
