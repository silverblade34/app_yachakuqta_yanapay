import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditorBlockPageProvider extends GetConnect {
  final box = GetStorage();
  late String token;

  EditorBlockPageProvider() {
    token = box.read("token");
  }

  Future<Response> createBlockPage(int page, String title,
      String syllabusBlockId, List<BlockEditorModel> dataBlocks) async {
    List<Map<String, dynamic>> blocksJson =
        dataBlocks.map((block) => block.toJson()).toList();

    try {
      Map<String, dynamic> payload = {
        'page': page,
        'title': title,
        'syllabusBlockId': syllabusBlockId,
        'blocks': blocksJson
      };
      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      final response = await post(
              '$url$versionService$methodCreateBlockPage', payload,
              headers: headers)
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
