import 'package:app_yachakuqta_yanapay/app/controllers/syllabus_student_controller.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/syllabus_student/widgets/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SyllabusStudentPage extends GetView<SyllabusStudentController> {
  const SyllabusStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "UNIDAD 1 - NÚMEROS OPERACIONES",
          style: TextStyle(fontSize: 17),
        ),
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            ExpansionCard(),
                 ExpansionCard()
          ],
        ),
      ),
    );
  }
}
