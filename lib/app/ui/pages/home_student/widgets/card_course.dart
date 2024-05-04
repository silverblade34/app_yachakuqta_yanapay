import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/list_courses_dto.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

Column CardCourse({required Course item}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: WHITE,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2), // Color de la sombra
              spreadRadius: 1, // Extensión de la sombra
              blurRadius: 2, // Difuminado de la sombra
              offset: const Offset(0, 1), // Desplazamiento de la sombra
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/icon_matematicas.png',
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: PRIMARY),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      item.createdAt.toString(),
                      style: const TextStyle(color: GREY_LIGHT),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: TERTIARY,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: WHITE,
                    ),
                  ),
                  onTap: () async {
                    print("GO TO DETALLES");
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
