import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/models/task.dart';
import 'package:flutter_to_do_list/widgets/to_do_list_item.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  final Function(Task) onDelete;

  const TasksList({
    Key? key,
    required this.tasks,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    double correctHeight = widget.tasks.length * 90;

    return SizedBox(
      height: (correctHeight < 300) ? (correctHeight) : 300,
      child: ListView(
        shrinkWrap: true,
        children: [
          for (Task task in widget.tasks)
            if (task.title.isNotEmpty)
              TodoListItem(task: task, onDelete: widget.onDelete),
        ],
      ),
    );
  }
}
