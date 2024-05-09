import 'package:app_yachakuqta_yanapay/app/controllers/editor_syllabus_controller.dart';
import 'package:flutter_quill/flutter_quill.dart';
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
          style: TextStyle(fontSize: 17),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Llama a la función para obtener el contenido del editor
              controller.obtenerContenidoEditor();
            },
          ),
        ],
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
            QuillToolbar.simple(
              configurations: QuillSimpleToolbarConfigurations(
                controller: controller.controllerQuill,
                sharedConfigurations: const QuillSharedConfigurations(
                  locale: Locale('es'),
                ),
              ),
            ),
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: controller.controllerQuill,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('es'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
