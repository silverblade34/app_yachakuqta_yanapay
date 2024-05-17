import 'package:app_yachakuqta_yanapay/app/controllers/blockpage_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockPageStudentPage extends GetView<BlockPageStudentController> {
  const BlockPageStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.dataSyllabusBlock.title,
          style: const TextStyle(fontSize: 17),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: controller.dataBlockPage.blocks.length,
                  itemBuilder: (context, index) {
                    var element = controller.dataBlockPage.blocks[index];
                    return controller.buildBlockWidget(element, context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
