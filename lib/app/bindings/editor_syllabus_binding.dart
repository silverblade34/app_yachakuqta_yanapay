import 'package:app_yachakuqta_yanapay/app/controllers/editor_syllabus_controller.dart';
import 'package:get/get.dart';

class EditorSyllabusBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<EditorSyllabusController>(() => EditorSyllabusController());
  }
}