import 'package:app_yachakuqta_yanapay/app/controllers/home_student_controller.dart';
import 'package:get/get.dart';

class HomeStudentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStudentController>(() => HomeStudentController());
  }
}
