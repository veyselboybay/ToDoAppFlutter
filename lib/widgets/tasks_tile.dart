import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  final String? title;
  final void Function(bool? ischeck)? checkboxCallback;
  final void Function() longPressCallback;

  TaskTile(
      {this.isChecked,
      this.title,
      this.checkboxCallback,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        title!,
        style: TextStyle(
            decoration:
                isChecked! ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
