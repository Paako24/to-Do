import 'package:flutter/material.dart';

class DeleteTodoForm extends StatelessWidget {
  final Function onConfirm;

  DeleteTodoForm({required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Yakin mau hapus?"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.pop(context);
          },
          child: Text("Delete", style: TextStyle(color: Colors.red),),
        ),
      ],
    );
  }
}
