import 'package:flutter/material.dart';
import 'package:flutter_to_do_list/widgets/dialog_button.dart';

class PendingAmount extends StatefulWidget {
  final int amount;
  final Function deletAll;

  const PendingAmount({
    Key? key,
    required this.amount,
    required this.deletAll,
  }) : super(key: key);

  @override
  State<PendingAmount> createState() => _PendingAmountState();
}

class _PendingAmountState extends State<PendingAmount> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'You have ${widget.amount} pending tasks',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DialogButton(
            showDeleteConfirmationDialog: showDeleteConfirmationDialog,
          ),
        ),
      ],
    );
  }

  void showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete all tasks?'),
          content: const Text('Do you realy want to delete all the tasks?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                widget.deletAll();
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
