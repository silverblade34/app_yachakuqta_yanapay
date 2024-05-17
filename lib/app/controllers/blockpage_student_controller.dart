import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/syllabus_student/syllabus_blocks_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/blockpage_student_repository.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class BlockPageStudentController extends GetxController {
  DataBlockPage dataBlockPage = Get.arguments["dataBlockPage"];
  DatumSyllabusBlock dataSyllabusBlock = Get.arguments["dataSyllabusBlock"];
  BlockPageStudentRepository blockPageStudentRepository =
      BlockPageStudentRepository();

  @override
  void onInit() async {
    super.onInit();
  }

  Widget buildBlockWidget(Block block, BuildContext context) {
    switch (block.type) {
      case 'TEXTO':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            block.content,
            style: const TextStyle(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
            maxLines: null,
          ),
        );
      case 'SUBTITULO':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            block.content,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: GREY_LIGHT,
            ),
            maxLines: null,
          ),
        );
      case 'TEXTO_SUBRAYADO':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            block.content,
            style: const TextStyle(
              fontSize: 14.0,
              decoration: TextDecoration.underline,
            ),
            maxLines: null,
          ),
        );
      case 'IMAGEN':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: block.content == ""
              ? Image.network(
                  'https://cdn.pixabay.com/photo/2017/01/25/17/35/picture-2008484_960_720.png',
                  width: block.details[0].width,
                  height: block.details[0].height,
                )
              : Image(
                  image: Image.file(
                    File(block.content),
                  ).image,
                  width: block.details[0].width,
                  height: block.details[0].height,
                  fit: BoxFit.contain,
                ),
        );
      default:
        return const SizedBox(); // Widget por defecto si el tipo de bloque no coincide
    }
  }
}
