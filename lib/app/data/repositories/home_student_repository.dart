import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/list_courses_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/providers/home_student_provider.dart';

class HomeStudentRepository {
  HomeStudentProvider api = HomeStudentProvider();

  Future<ListCoursesDto> findAllCoursesToSyllabus() async {
    final response = await api.findAllCoursesToSyllabus();
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    ListCoursesDto data = ListCoursesDto.fromJson(body);
    return data;
  }
}
