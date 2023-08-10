import 'dart:convert';

import 'package:flutter_to_do_list/adapters/tasks_adapter.dart';
import 'package:flutter_to_do_list/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

const tasksListKey = 'tasks';

class TasksRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Task>> getTasksList() async {
    sharedPreferences = await SharedPreferences.getInstance();

    String? json = sharedPreferences.getString(tasksListKey) ?? "[]";

    List<Task> tasks = List<Task>.from(
        (jsonDecode(json)).map((e) => TasksAdapter.fromMap(e)).toList());

    return tasks;
  }

  void saveTasksList(List<Task> tasks) async {
    String json = jsonEncode(tasks.map((e) => e.toJson()).toList());
    sharedPreferences.setString(tasksListKey, json);
  }
}
