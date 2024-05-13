import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BlockPageStudentProvider extends GetConnect {
  final box = GetStorage();
  late String token;

  BlockPageStudentProvider() {
    token = box.read("token");
  }

  Future<Response> findOneBlockPage(String blockPageId) async {
    try {
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await get('$url$versionService$methodFindOneBlockPage$blockPageId',
              headers: headers)
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
