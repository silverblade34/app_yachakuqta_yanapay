import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/course_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/home_student_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeStudentController extends GetxController {
  RxList<Course> dataCourses = RxList([]);
  HomeStudentRepository homeStudentRepository = HomeStudentRepository();

  @override
  void onInit() async {
    super.onInit();
    EasyLoading.show(status: 'Cargando...');
    await getFindAllCourses();
    EasyLoading.dismiss();
  }

  getFindAllCourses() async {
    try {
      final validate = await homeStudentRepository.findAllCoursesToSyllabus();
      dataCourses.value = validate.data;
    } catch (error) {
      try {
        String errorMessage = error.toString().split(":")[1].trim();
        EasyLoading.showInfo(errorMessage);
      } catch (e) {
        EasyLoading.showInfo(error.toString());
      }
    }
  }

  getToCourseDetail(Course item) {
    Get.toNamed("/course_student", arguments: item);
  }
}
