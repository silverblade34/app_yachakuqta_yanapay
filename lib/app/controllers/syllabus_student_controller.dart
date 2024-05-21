import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/syllabus_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/syllabus_student/syllabus_blocks_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/blockpage_student_repository.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/syllabus_student_repository.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SyllabusStudentController extends GetxController {
  Syllabus syllabusItem = Get.arguments;
  RxList<DatumSyllabusBlock> dataSyllabusBlocks = RxList([]);
  SyllabusStudentRepository syllabusStudentRepository =
      SyllabusStudentRepository();
  BlockPageStudentRepository blockPageStudentRepository =
      BlockPageStudentRepository();

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: 'Cargando...');
    await getSyllabusBlocks();
    EasyLoading.dismiss();
  }

  getSyllabusBlocks() async {
    try {
      final validate =
          await syllabusStudentRepository.findAllSyllabusBlocks(syllabusItem.id);
      dataSyllabusBlocks.value = validate.data;
    } catch (error) {
      try {
        String errorMessage = error.toString().split(":")[1].trim();
        EasyLoading.showInfo(errorMessage);
      } catch (e) {
        EasyLoading.showInfo(error.toString());
      }
    }
  }

  showSyllabusMenuOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.live_help_outlined),
                title: const Text('Foro de la unidad'),
                onTap: () {
                 
                },
              ),
              ListTile(
                leading: const Icon(Icons.smart_toy_outlined),
                title: const Text('Desafio final'),
                onTap: () {
                 
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  showDialogStartExam(DatumSyllabusBlock item) async {
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
                text: '"${item.title}"!',
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

  goToBlockPage(
      String blockPageId, DatumSyllabusBlock dataSyllabusBlock) async {
    try {
      final validate =
          await blockPageStudentRepository.findOneBlockPage(blockPageId);
      DataBlockPage dataBlockPage = validate.data;
      Get.toNamed("/blockpage_student", arguments: {
        "dataBlockPage": dataBlockPage,
        "dataSyllabusBlock": dataSyllabusBlock
      });
    } catch (error) {
      try {
        String errorMessage = error.toString().split(":")[1].trim();
        EasyLoading.showInfo(errorMessage);
      } catch (e) {
        EasyLoading.showInfo(error.toString());
      }
    }
  }
}
