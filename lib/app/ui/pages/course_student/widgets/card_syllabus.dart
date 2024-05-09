import 'package:app_yachakuqta_yanapay/app/controllers/course_student_controller.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/syllabus_dto.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Column CardSyllabus(
    {required Syllabus item,
    required int index,
    required CourseStudentController courseStudentCL}) {
  return Column(
    children: [
      InkWell(
        child: Container(
          padding: const EdgeInsets.all(10),
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
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: PRIMARY,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.history_edu,
                      color: WHITE,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Unidad ${index.toString()}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: GREY_LIGHT,
                          ),
                        ),
                        Text(item.title),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Get.toNamed("/syllabus_student");
        },
      ),
      const SizedBox(
        height: 5,
      )
    ],
  );
}
