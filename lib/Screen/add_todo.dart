import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/todo_controller.dart';
import '../Model/model.dart';

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

class _AddTodoFormState extends State <AddTodoForm> {
  final _formKey = GlobalKey <FormState> ();
  late String description;

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find <TodoController> ();
    return Scaffold(
      body: Container(
        key: _formKey,
        padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: TextFormField(
                    onSaved: (value) => description = value!,
                    decoration: const InputDecoration(
                        hintText: "Apa yang kamu ingin kerjakan",
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
                    // ignore: deprecated_member_use
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('Cancel',
                            style: TextStyle(
                              color: Colors.white
                            ), ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('Tambah',
                            style: TextStyle(
                              color: Colors.white
                            ), ),
                          onPressed: () {
                            _formKey.currentState!.save();
                            todoController.addTodo(Todo(description: description));
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }
}