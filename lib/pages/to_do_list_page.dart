import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/models/task.dart';
import 'package:flutter_to_do_list/repositories/tasks_repository.dart';
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
  final TasksRepository repository = TasksRepository();

  @override
  void initState() {
    super.initState();
    repository.getTasksList().then((value) {
      setState(() => tasks = value);
    });
  }

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

  Future<void> addTask(Task task, TextEditingController controller) async {
    setState(() {
      if (task.title.isNotEmpty) {
        tasks.add(task);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.only(
                left: 40,
                right: 40,
                bottom: MediaQuery.of(context).size.height * 0.25),
            backgroundColor: Colors.red,
            content: const Text(
              "A task must have a title!",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    });

    repository.saveTasksList(tasks);
    controller.clear();
  }

  void onDelete(Task task) {
    int index = tasks.indexOf(task);

    setState(() => tasks.remove(task));
    repository.saveTasksList(tasks);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      createSnackBar(index: index, task: task, restoreOne: restoreTask),
    );
  }

  void restoreTask(int index, Task task) {
    setState(() => tasks.insert(index, task));
    repository.saveTasksList(tasks);
  }

  void deletAll() {
    List<Task> backup = List<Task>.of(tasks);
    setState(() => tasks.clear());
    repository.saveTasksList(tasks);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      createSnackBar(backup: backup, restoreAll: restoreAllTasks, all: true),
    );
  }

  void restoreAllTasks(List<Task> backup) {
    setState(() => tasks.addAll(backup));
    repository.saveTasksList(tasks);
  }
}
