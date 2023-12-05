import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Get.back();
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Get.back();
          },
          child: Text("Hapus", style: TextStyle(color: Colors.red),),
        ),
      ],
    );
  }
}
