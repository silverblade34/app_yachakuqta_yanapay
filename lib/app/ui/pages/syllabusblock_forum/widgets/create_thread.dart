import 'package:app_yachakuqta_yanapay/app/controllers/syllabusblock_forum_controller.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container CreateThread({required SyllabusBlockForumController controller}) {
  return Container(
    padding: const EdgeInsets.all(15),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BACKGROUND_LIGHT_CREAM,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 25,
            height: 25,
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
          Expanded(
            child: GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: WHITE,
                ),
                child: const Text(
                  "¿Tienes alguna duda?",
                ),
              ),
              onTap: () {
                print("se esta abriendo modal de crear thread");
              },
            ),
          )
        ],
      ),
    ),
  );
}
