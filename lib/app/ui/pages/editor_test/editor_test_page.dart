import 'package:app_yachakuqta_yanapay/app/controllers/editor_test_controller.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorTestPage extends GetView<EditorTestController> {
  const EditorTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Crear contenido de pagina',
          style: TextStyle(fontSize: 17),
        ),
        elevation: 4,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: WHITE, borderRadius: BorderRadius.circular(8)),
            child: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: controller.titleBlockPage,
              decoration: const InputDecoration(
                hintText: 'Insertar título',
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
              ),
              textAlign: TextAlign.justify,
              maxLines:
                  null, // Permite que el campo de texto se expanda dinámicamente
              textInputAction: TextInputAction.newline,
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return controller.dataBlocks.isEmpty
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: 35.0,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Seleccione un bloque para agregar contenido',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: GREY_LIGHT,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.dataBlocks.length,
                        itemBuilder: (context, index) {
                          var element = controller.dataBlocks[index];
                          return controller.buildBlockWidget(element, context);
                        },
                      );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.showBlockSelectionModal(context);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
