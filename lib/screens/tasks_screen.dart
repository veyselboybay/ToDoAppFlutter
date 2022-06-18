import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/providers/task_list_provider.dart';
import 'package:todoey/screens/add_task_screen.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    final taskLengt = Provider.of<TaskListProvider>(context).getTaskLength;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: AddTaskScreen(),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60.0,
              left: 30.0,
              right: 30.0,
              bottom: 30.0,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                  size: 30.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Todoey',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                ),
              ),
              Text(
                taskLengt.toString() + ' task left to complete!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ]),
          ),
          // White bottom of the screen
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
