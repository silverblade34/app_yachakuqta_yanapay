import 'package:app_yachakuqta_yanapay/app/controllers/home_student_controller.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/course_dto.dart';
import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Column CardCourse(
    {required Course item, required HomeStudentController homeStudentCL}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(
                      item.imageIcon != ""
                          ? '$urlImages$versionService$methodGetImageCourse${item.imageIcon}'
                          : 'https://cdn-icons-png.flaticon.com/512/5965/5965835.png',
                      width: 50,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: PRIMARY),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${item.totalSyllabus} Unidades",
                          style: const TextStyle(color: GREY_LIGHT),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: TERTIARY,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: WHITE,
                      size: 17,
                    ),
                  ),
                  onTap: () async {
                    homeStudentCL.getToCourseDetail(item);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}
