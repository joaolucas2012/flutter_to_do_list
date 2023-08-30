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

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: tasksController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Add a task',
              hintText: 'Ex: Study Flutter',
              errorText: errorText,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.purple,
                ),
              ),
              labelStyle: const TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ElevatedButton(
              onPressed: () async => await onAdd(),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  fixedSize: const Size(45, 45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center),
              child: const Icon(
                color: Colors.white,
                Icons.add,
                size: 20,
              )),
        )
      ],
    );
  }

  Future<void> onAdd() async {
    if (tasksController.text.isNotEmpty) {
      await widget.addTask(
        Task(
          title: tasksController.text,
          dateTime: DateTime.now(),
        ),
        tasksController,
      );

      if (errorText != null) setState(() => errorText = null);
    } else {
      setState(() => errorText = 'A task must have a title!');
      return;
    }
  }
}
