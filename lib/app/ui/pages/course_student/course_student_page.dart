import 'package:app_yachakuqta_yanapay/app/controllers/course_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseStudentPage extends GetView<CourseStudentController> {
  const CourseStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.courseData.title.toUpperCase(),
            style: const TextStyle(fontSize: 17),
          ),
          elevation: 4,
        ),
        body: SafeArea(child: Column(
          children: [Container()],
        ),),);
  }
}
