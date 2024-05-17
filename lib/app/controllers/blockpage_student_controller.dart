import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/syllabus_student/syllabus_blocks_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/blockpage_student_repository.dart';
import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockPageStudentController extends GetxController {
  DataBlockPage dataBlockPage = Get.arguments["dataBlockPage"];
  DatumSyllabusBlock dataSyllabusBlock = Get.arguments["dataSyllabusBlock"];
  BlockPageStudentRepository blockPageStudentRepository =
      BlockPageStudentRepository();
  RxBool statusIconNext = true.obs;

  @override
  void onInit() async {
    super.onInit();
    int lengthBlockPages = dataSyllabusBlock.blockPages.length;
    if (dataBlockPage.page == lengthBlockPages) {
      statusIconNext.value = false;
    }
  }

  goToNext() async {
    if (statusIconNext.value) {
      BlockPageResume blockPage = dataSyllabusBlock.blockPages.firstWhere(
        (block) => block.page == dataBlockPage.page + 1,
      );
      final validate =
          await blockPageStudentRepository.findOneBlockPage(blockPage.id);
      DataBlockPage newDataBlockPage = validate.data;
      Get.toNamed("/blockpage_student", arguments: {
        "dataBlockPage": newDataBlockPage,
        "dataSyllabusBlock": dataSyllabusBlock
      });
    } else {
      print("------------EMPEZAR EVALUACION------------");
    }
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
          child: Image.network(
            '$urlImages$versionService$methodGetImageCourse${block.nameImage}',
            width: block.details[0].width,
            height: block.details[0].height,
          ),
        );
      default:
        return const SizedBox(); // Widget por defecto si el tipo de bloque no coincide
    }
  }
}
