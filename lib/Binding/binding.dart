import 'package:get/get.dart';
import '../Controller/todo_controller.dart';
import '../Screen/home_screen.dart';


class ScreenBinding extends Bindings{
  
  @override
  void dependencies() {
     Get.put<TodoController>(TodoController());
  }
}