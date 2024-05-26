import 'package:app_yachakuqta_yanapay/app/controllers/syllabusblock_forum_controller.dart';
import 'package:get/get.dart';

class SyllabusBlockForumBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<SyllabusBlockForumController>(() => SyllabusBlockForumController());
  }
}