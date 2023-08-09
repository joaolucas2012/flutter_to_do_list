import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/models/task.dart';
import 'package:flutter_to_do_list/utils/functions/create_snackbar.dart';
import 'package:flutter_to_do_list/widgets/add_tasks_container.dart';
import 'package:flutter_to_do_list/widgets/pending_amount.dart';
import 'package:flutter_to_do_list/widgets/tasks_list.dart';

class TodoListListPage extends StatefulWidget {
  const TodoListListPage({Key? key}) : super(key: key);

  @override
  State<TodoListListPage> createState() => _TodoListListPageState();
}

class _TodoListListPageState extends State<TodoListListPage> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AddTasksContainer(tasks: tasks, addTask: addTask),
                const SizedBox(height: 16),
                TasksList(tasks: tasks, onDelete: onDelete),
                const SizedBox(height: 16),
                PendingAmount(amount: tasks.length, deletAll: deletAll),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addTask(Task task, TextEditingController controller) {
    setState(() => tasks.add(task));
    controller.clear();
  }

  void onDelete(Task task) {
    int index = tasks.indexOf(task);

    setState(() => tasks.remove(task));

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      createSnackBar(index: index, task: task, restoreOne: restoreTask),
    );
  }

  void restoreTask(int index, Task task) {
    setState(() => tasks.insert(index, task));
  }

  void deletAll() {
    List<Task> backup = List<Task>.of(tasks);
    setState(() => tasks.clear());

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      createSnackBar(backup: backup, restoreAll: restoreAllTasks, all: true),
    );
  }

  void restoreAllTasks(List<Task> backup) {
    setState(() => tasks.addAll(backup));
  }
}
