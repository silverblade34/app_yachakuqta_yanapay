import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/syllabus_student/syllabus_blocks_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/blockpage_student_repository.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/syllabus_student_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SyllabusStudentController extends GetxController {
  String syllabusId = Get.arguments;
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
          await syllabusStudentRepository.findAllSyllabusBlocks(syllabusId);
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
