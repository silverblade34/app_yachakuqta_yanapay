import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/syllabus_student/syllabus_blocks_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/blockpage_student_repository.dart';
import 'package:get/get.dart';

class BlockPageStudentController extends GetxController {
  DataBlockPage dataBlockPage = Get.arguments["dataBlockPage"];
  DatumSyllabusBlock dataSyllabusBlock = Get.arguments["dataSyllabusBlock"];
  BlockPageStudentRepository blockPageStudentRepository =
      BlockPageStudentRepository();

  @override
  void onInit() async {
    super.onInit();
  }
}
