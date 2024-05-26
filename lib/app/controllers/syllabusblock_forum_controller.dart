import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/syllabus_dto.dart';
import 'package:get/get.dart';

class SyllabusBlockForumController extends GetxController {
  String syllabusBlockId = Get.arguments["syllabusBlockId"];
  String syllabusBlockName = Get.arguments["syllabusBlockName"];
  Syllabus syllabusItem = Get.arguments["syllabusItem"];
  String typeForum = Get.arguments["typeForum"];
}
