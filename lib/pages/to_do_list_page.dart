// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/widgets/to_do_list_item.dart';

class TodoListListPage extends StatefulWidget {
  const TodoListListPage({Key? key}) : super(key: key);

  @override
  State<TodoListListPage> createState() => _TodoListListPageState();
}

class _TodoListListPageState extends State<TodoListListPage> {
  final TextEditingController tasksController = TextEditingController();

  List<String> tasks = [];

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
                              tasks.add(tasksController.text);
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
                      for (String text in tasks)
                        if (text.isNotEmpty) TodoListItem(title: text)
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
