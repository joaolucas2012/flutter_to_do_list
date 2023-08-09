import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/models/task.dart';

class AddTasksContainer extends StatefulWidget {
  final List<Task> tasks;
  final Function(Task, TextEditingController) addTask;

  const AddTasksContainer({
    Key? key,
    required this.tasks,
    required this.addTask,
  }) : super(key: key);

  @override
  State<AddTasksContainer> createState() => _AddTasksContainerState();
}

class _AddTasksContainerState extends State<AddTasksContainer> {
  final TextEditingController tasksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: tasksController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Add a task',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: ElevatedButton(
              onPressed: () => widget.addTask(
                    Task(
                      title: tasksController.text,
                      dateTime: DateTime.now(),
                    ),
                    tasksController,
                  ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                fixedSize: const Size(20, 45),
              ),
              child: const Icon(
                Icons.add,
                size: 20,
              )),
        )
      ],
    );
  }
}
