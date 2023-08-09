import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final Function showDeleteConfirmationDialog;

  const DialogButton({
    Key? key,
    required this.showDeleteConfirmationDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDeleteConfirmationDialog(),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        fixedSize: const Size(125, 35),
      ),
      child: const Text('Clean all tasks'),
    );
  }
}
