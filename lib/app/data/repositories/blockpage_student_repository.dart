import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/providers/blockpage_student_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class BlockPageStudentRepository {
  BlockPageStudentProvider api = BlockPageStudentProvider();

  Future<BlockPageDto> findOneBlockPage(String blockPageId) async {
    final response = await api.findOneBlockPage(blockPageId);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.statusCode == 401) {
      GetStorage().erase();
      Get.offAllNamed('/login');
    } else if (response.body["status"] == false || response.body["statusCode"] == 401) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    BlockPageDto data = BlockPageDto.fromJson(body);
    return data;
  }
}
