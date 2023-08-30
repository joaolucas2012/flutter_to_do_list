import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/models/task.dart';

SnackBar createSnackBar({
  int? index,
  List<Task>? backup,
  Task? task,
  Function(int, Task)? restoreOne,
  Function? restoreAll,
  bool all = false,
  String? text,
}) {
  String message = "";

  if (text != null && text.isNotEmpty) {
    message = text;
  } else {
    message = (!all)
        ? 'Task ${task!.title} was successfully deleted!'
        : 'Tasks were successfully deleted';
  }

  return SnackBar(
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
    ),
    backgroundColor: Colors.purple,
    action: SnackBarAction(
      label: 'undo',
      textColor: Colors.white,
      onPressed: () {
        (all) ? restoreAll!(backup) : restoreOne!(index!, task!);
      },
    ),
    duration: const Duration(seconds: 4),
  );
}
