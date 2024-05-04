import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeStudentProvider extends GetConnect {
  final box = GetStorage();
  late String token;

  HomeStudentProvider() {
    token = box.read("token");
  }

  Future<Response> findAllCourses() async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response =
          await post('$url$versionService$methodFindAllCourses', headers)
              .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
