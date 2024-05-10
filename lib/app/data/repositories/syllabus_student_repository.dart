
import 'package:app_yachakuqta_yanapay/app/data/dtos/syllabus_student/syllabus_blocks_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/providers/syllabus_student_provider.dart';

class SyllabusStudentRepository {

 SyllabusStudentProvider api = SyllabusStudentProvider();

  Future<SyllabusBlocksDto> findAllSyllabusBlocks(String syllabusId) async {
    final response = await api.findAllSyllabusBlocks(syllabusId);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    SyllabusBlocksDto data = SyllabusBlocksDto.fromJson(body);
    return data;
  }
}