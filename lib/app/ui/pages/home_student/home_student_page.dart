import 'package:app_yachakuqta_yanapay/app/controllers/home_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeStudentPage extends GetView<HomeStudentController> {
  const HomeStudentPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('HomeStudentPage')),

    body: SafeArea(
      child: Text('HomeStudentController'))
    );
  }
}