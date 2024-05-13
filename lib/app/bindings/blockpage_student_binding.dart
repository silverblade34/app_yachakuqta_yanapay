import 'package:app_yachakuqta_yanapay/app/controllers/blockpage_student_controller.dart';
import 'package:get/get.dart';

class BlockPageStudentBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<BlockPageStudentController>(() => BlockPageStudentController());
  }
}