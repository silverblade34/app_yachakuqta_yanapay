import 'package:app_yachakuqta_yanapay/app/controllers/home_teacher_controller.dart';
import 'package:get/get.dart';

class HomeTeacherBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeTeacherController>(() => HomeTeacherController());
  }
}