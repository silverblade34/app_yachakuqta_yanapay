import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:app_yachakuqta_yanapay/app/data/providers/editor_blockpage_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditorBlockPageRepository {
  EditorBlockPageProvider api = EditorBlockPageProvider();

  Future<dynamic> createBlockPage(int page, String title,
      String syllabusBlockId, List<BlockEditorModel> dataBlocks) async {
    final response =
        await api.createBlockPage(page, title, syllabusBlockId, dataBlocks);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.statusCode == 401) {
      GetStorage().erase();
      Get.offAllNamed('/login');
    } else if (response.body["status"] == false ||
        response.body["statusCode"] == 401) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    return body;
  }
}
