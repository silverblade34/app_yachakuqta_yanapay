import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/blockpage_student_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart';

class BlockPageStudentController extends GetxController {
  late DataBlockPage dataBlockPage;
  BlockPageStudentRepository blockPageStudentRepository =
      BlockPageStudentRepository();

  late QuillController quillController;

  @override
  void onInit() async {
    super.onInit();
    await getBlockPageData();
  }

  Future<void> getBlockPageData() async {
    try {
      EasyLoading.show(status: 'Cargando...');
      DataBlockPage? data = Get.arguments;
      if (data != null) {
        dataBlockPage = data;
        quillController = QuillController(
          document: Document.fromJson(dataBlockPage.delta),
          selection: const TextSelection.collapsed(offset: 0),
        );
        EasyLoading.dismiss();
      } else {
        EasyLoading.showError("Error al obtener datos de la página");
      }
    } catch (error) {
      EasyLoading.dismiss();
      EasyLoading.showError("Error al cargar datos de la página");
    }
  }
}