import 'package:app_yachakuqta_yanapay/app/controllers/home_teacher_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTeacherPage extends GetView<HomeTeacherController> {
  const HomeTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomeTeacherPage')),
        body: SafeArea(child: Text('HomeTeacherController')));
  }
}
