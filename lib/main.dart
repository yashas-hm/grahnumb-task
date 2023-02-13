import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grahnumb_task/controller/controller.dart';
import 'package:grahnumb_task/screens/list_screen.dart';
void main() {
  Get.put(BlogController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      title: 'Grahnumb Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ListScreen(),
    );
  }
}