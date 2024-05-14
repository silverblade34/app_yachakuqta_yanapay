import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/blockpage_student_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BlockPageStudentController extends GetxController {
  late DataBlockPage dataBlockPage;
  BlockPageStudentRepository blockPageStudentRepository =
      BlockPageStudentRepository();

  
  @override
  void onInit() async {
    super.onInit();
  }

 
}