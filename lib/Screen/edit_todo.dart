import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/todo_controller.dart';
import '../Model/model.dart';

class EditTodoForm extends StatefulWidget {
  final Todo todo;
  final String type;

  EditTodoForm({
    Key ? key,
    required this.todo,
    required this.type
  }): super(key: key);

  @override
  _EditTodoFormState createState() => _EditTodoFormState();
}

class _EditTodoFormState extends State <EditTodoForm> {
  final _formKey = GlobalKey <FormState> ();
  late String description;

  @override
  Widget build(BuildContext context) {
    final todoController = Get.find <TodoController> ();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: widget.todo.description,
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
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text('Cancel',
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                          onPressed: () {
                            Get.back();
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
                        child: const Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white
                            ), ),
                          onPressed: () {
                            _formKey.currentState!.save();
                            todoController.updateTodo(widget.todo, description);
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
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