import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/course_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/syllabus_dto.dart';
import 'package:get/get.dart';

class CourseStudentController extends GetxController {
  Course courseData = Get.arguments;

  goToSyllabusStudent(Syllabus item) {
    Get.toNamed("/syllabus_student", arguments: item.id);
  }
}
