import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/syllabus_student/syllabus_blocks_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/blockpage_student_repository.dart';
import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BlockPageStudentController extends GetxController {
  Rx<DataBlockPage> dataBlockPage = Rx(DataBlockPage(
      id: "0",
      page: 0,
      title: "",
      syllabusBlockId: "",
      blocks: [],
      createdAt: DateTime.now(),
      v: 0));
  DatumSyllabusBlock dataSyllabusBlock = Get.arguments["dataSyllabusBlock"];
  BlockPageStudentRepository blockPageStudentRepository =
      BlockPageStudentRepository();
  RxBool statusIconNext = true.obs;

  @override
  void onInit() async {
    super.onInit();
    dataBlockPage.value = Get.arguments["dataBlockPage"];
    validateStatusNext(dataBlockPage.value.page);
  }

  goToNext() async {
    if (statusIconNext.value) {
      BlockPageResume blockPage = dataSyllabusBlock.blockPages.firstWhere(
        (block) => block.page == dataBlockPage.value.page + 1,
      );

      final validate =
          await blockPageStudentRepository.findOneBlockPage(blockPage.id);
      DataBlockPage newDataBlockPage = validate.data;
      dataBlockPage.value = newDataBlockPage;
      validateStatusNext(newDataBlockPage.page);
    } else {
      showDialogStartExam();
    }
  }

  showDialogStartExam() async {
    Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          '¿Listo para un desafío?',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: TERTIARY,
          ),
          textAlign: TextAlign.center,
        ),
        content: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              const TextSpan(
                text: '¡Comprueba tus habilidades en el tema ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              TextSpan(
                text: '"${dataSyllabusBlock.title}"!',
                style: const TextStyle(
                  fontSize: 16,
                  color: GREY_LIGHT,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('NO'),
          ),
          TextButton(
            onPressed: () {
              EasyLoading.show(status: 'Cargando... ⏳');
              Get.back();
              EasyLoading.dismiss();
            },
            child: const Text('SÍ'),
          ),
        ],
      ),
    );
  }

  validateStatusNext(int page) {
    int lengthBlockPages = dataSyllabusBlock.blockPages.length;
    if (page == lengthBlockPages) {
      statusIconNext.value = false;
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
