import 'package:app_yachakuqta_yanapay/app/controllers/syllabusblock_forum_controller.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container ThreadQuestion({required SyllabusBlockForumController controller}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BACKGROUND_LIGHT,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: WHITE,
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/icono_user.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Juan Espinoza Rodriguez",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: GREY_LIGHT,
                    ),
                  ),
                  Text(
                    "Alumno",
                    style: TextStyle(
                      fontSize: 10,
                      color: GREY_LIGHT,
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: Column(
              children: [
                const Text(
                    "Porque en la sumatorio cuando sumas - con +  sale negativo?"),
                const SizedBox(
                  height: 15,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "0 Comentarios",
                      style: TextStyle(
                        fontSize: 11,
                        color: GREY_LIGHT,
                      ),
                    )
                  ],
                ),
                InkWell(
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sms_outlined,
                        size: 14,
                        color: PRIMARY,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Comentar",
                        style: TextStyle(
                          fontSize: 12,
                          color: PRIMARY,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    print("ABRIR COMENTARIOS");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
