import 'package:app_yachakuqta_yanapay/app/controllers/editor_syllabus_controller.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorSyllabusPage extends GetView<EditorSyllabusController> {
  const EditorSyllabusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EDITOR DE TEXTO",
          style: TextStyle(fontSize: pageTitleGlobal),
        ),
        actions: [
     
        ],
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
