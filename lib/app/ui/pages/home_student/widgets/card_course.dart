import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/list_courses_dto.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/widgets.dart';

Column CardCourse({required Course item}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: WHITE,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/icon_matematicas.png',
                  width: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text("Matematicas")
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
