import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SyllabusStudentProvider extends GetConnect {
  final box = GetStorage();
  late String token;

  SyllabusStudentProvider() {
    token = box.read("token");
  }

  Future<Response> findAllSyllabusBlocks(String syllabusId) async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await get(
              '$url$versionService$methodFindAllSyllabusBlocks$syllabusId',
              headers: headers)
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
