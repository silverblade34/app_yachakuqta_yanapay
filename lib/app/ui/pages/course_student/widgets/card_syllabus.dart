import 'package:app_yachakuqta_yanapay/app/controllers/course_student_controller.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/syllabus_dto.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container CardSyllabus(
    {required Syllabus item,
    required CourseStudentController courseStudentCL}) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: WHITE,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    margin: const EdgeInsets.only(bottom: 5),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/icono_item_curso.png',
              width: 50,
            ),
            Expanded(
              child: Text(item.title),
            )
          ],
        ),
      ],
    ),
  );
}
