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
          fixedSize: const Size(145, 35),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      child:
          const Text('Clean all tasks', style: TextStyle(color: Colors.white)),
    );
  }
}
