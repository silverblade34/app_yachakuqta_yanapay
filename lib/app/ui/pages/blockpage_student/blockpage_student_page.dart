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
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.dataBlockPage.value.blocks.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            controller.dataBlockPage.value.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        );
                      } else {
                        // Ajustar el índice para obtener el elemento correcto de la lista
                        var element =
                            controller.dataBlockPage.value.blocks[index - 1];
                        return controller.buildBlockWidget(element, context);
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          onPressed: () {
            controller.goToNext();
          },
          child: controller.statusIconNext.value == true
              ? const Icon(Icons.skip_next_outlined)
              : const Icon(Icons.smart_toy_outlined),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
