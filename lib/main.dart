import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:refactor/Binding/binding.dart';
import '../Screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: HomeScreen(),
      initialBinding: HomeBinding(),
    );
  }
}