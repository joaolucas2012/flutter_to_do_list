import 'package:flutter/material.dart';

class TodoListListPage extends StatelessWidget {
  const TodoListListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Add a task',
                      ),
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
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'You have 0 pending tasks',
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
    );
  }
}
