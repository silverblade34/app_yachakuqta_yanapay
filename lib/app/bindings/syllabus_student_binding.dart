import 'package:app_yachakuqta_yanapay/app/controllers/syllabus_student_controller.dart';
import 'package:get/get.dart';

class SyllabusStudentBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<SyllabusStudentController>(() => SyllabusStudentController());
  }
}