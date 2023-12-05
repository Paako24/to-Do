import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/todo_controller.dart';
import '../Model/model.dart';
import '../Utils/button.dart';

class AddTodoForm extends StatefulWidget {
  final String type;
  final Todo ? todo;

  const AddTodoForm({
    Key ? key,
    required this.type,
    required this.todo
  }): super(key: key);

  @override
  _AddTodoFormState createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State < AddTodoForm > {
  final _formKey = GlobalKey < FormState > ();
  late String description = '';

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find < TodoController > ();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: TextFormField(
                    onSaved: (value) => description = value!,
                    decoration: const InputDecoration(
                        hintText: "Masukkan Todo",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      text: 'Cancel',
                      color: Colors.red,
                      onPressed: () {
                      Get.back();
                      },
                    ),
                    CustomButton(
                      text: 'Tambah',
                      color: Colors.green,
                      onPressed: () {
                        _formKey.currentState?.save();
                        todoController.addTodo(Todo(description: description));
                        Get.back();
                      },
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