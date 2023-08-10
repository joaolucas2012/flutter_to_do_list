import 'package:flutter_to_do_list/models/task.dart';

class TasksAdapter extends Task {
  TasksAdapter({
    required super.title,
    required super.dateTime,
  });

  static Task fromMap(Map<String, dynamic> source) {
    return Task(
      title: source["title"],
      dateTime: DateTime.parse(source["dateTime"]),
    );
  }
}
