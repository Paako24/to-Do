import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/todo_controller.dart';
import '../Screen/edit_todo.dart';
import '../Screen/add_todo.dart';
import '../Screen/delete_todo.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State <HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final todoController = Get.find <TodoController> ();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: GetBuilder(
        builder: (TodoController todoController) {
          return ListView.builder(
            itemCount: todoController.todos.length,
            itemBuilder: (context, index) {
              return Card(
                color: Color(0xFFEEEFF5),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return EditTodoForm(
                              type: "update",
                              todo: todoController.todos[index],
                            );
                          },
                        );
                      },
                      leading: Checkbox(
                        value: todoController.todos[index].isCompleted,
                        onChanged: (value) {
                          todoController.changeStatus(todoController.todos[index]);
                        },
                      ),
                      title: Text(
                        todoController.todos[index].description,
                        style: TextStyle(
                          color: todoController.todos[index].isCompleted
                              ? Colors.black54 
                              : Colors.black,

                          decoration: todoController.todos[index].isCompleted
                              ? TextDecoration.lineThrough 
                              : TextDecoration.none, 
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteTodoForm(
                                onConfirm: () {
                                  todoController.deleteTodo(todoController.todos[index].id);
                                },
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.delete_rounded, color: Colors.red,),
                      ),
                    ),
                  ],
                ),
              );
            },
          );

        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddTodoForm(
                type: "new", todo: null,
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}