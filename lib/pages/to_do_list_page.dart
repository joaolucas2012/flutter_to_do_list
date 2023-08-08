// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/models/task.dart';
import 'package:flutter_to_do_list/widgets/to_do_list_item.dart';

class TodoListListPage extends StatefulWidget {
  const TodoListListPage({Key? key}) : super(key: key);

  @override
  State<TodoListListPage> createState() => _TodoListListPageState();
}

class _TodoListListPageState extends State<TodoListListPage> {
  final TextEditingController tasksController = TextEditingController();

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
                Row(
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
                          onPressed: () {
                            setState(() {
                              tasks.add(Task(
                                  title: tasksController.text,
                                  dateTime: DateTime.now()));
                              tasksController.clear();
                            });
                          },
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
                ),
                const SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Task task in tasks)
                        if (task.title.isNotEmpty) TodoListItem(task: task)
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'You have ${tasks.length} pending tasks',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          print("Clicou");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          fixedSize: const Size(125, 35),
                        ),
                        child: const Text('Clean all tasks'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
