import 'package:app_yachakuqta_yanapay/app/controllers/course_student_controller.dart';
import 'package:get/get.dart';

class CourseStudentBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<CourseStudentController>(() => CourseStudentController());
  }
}