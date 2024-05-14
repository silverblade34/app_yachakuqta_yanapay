import 'package:app_yachakuqta_yanapay/app/controllers/editor_test_controller.dart';
import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorTestPage extends GetView<EditorTestController> {
  const EditorTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Contenido Dinámico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Obx(
          () => controller.dataBlocks.isEmpty
              ? Center(
                  child: GestureDetector(
                    onTap: () => showBlockSelectionModal(context, controller),
                    child: Text(
                      'Seleccione un bloque para agregar',
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                )
              : Column(
                  children: [
                    ...controller.dataBlocks.asMap().entries.map((entry) {
                      int index = entry.key;
                      BlockEditorModel block = entry.value;
                      return GestureDetector(
                        onDoubleTap: () => toggleEditMode(index, block),
                        child: buildBlockWidget(block, index),
                      );
                    }).toList(),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => showBlockSelectionModal(context, controller),
                      child: Text(
                        'Agregar otro bloque',
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  void showBlockSelectionModal(BuildContext context, EditorTestController controller) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.title),
              title: Text('Título'),
              onTap: () {
                controller.addBlock(BlockEditorModel(type: 'title', content: 'Título'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.subtitles),
              title: Text('Subtítulo'),
              onTap: () {
                controller.addBlock(BlockEditorModel(type: 'subtitle', content: 'Subtítulo'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lista'),
              onTap: () {
                controller.addBlock(BlockEditorModel(type: 'list', content: '• Elemento 1\n• Elemento 2\n• Elemento 3'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Imagen'),
              onTap: () {
                controller.addBlock(BlockEditorModel(type: 'image', content: 'https://via.placeholder.com/150'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.text_fields),
              title: Text('Texto Subrayado'),
              onTap: () {
                controller.addBlock(BlockEditorModel(type: 'underline', content: 'Texto Subrayado'));
                Navigator.pop(context);
              },
            ),
            // Agrega más opciones de bloques aquí
          ],
        );
      },
    );
  }

  Widget buildBlockWidget(BlockEditorModel block, int index) {
    switch (block.type) {
      case 'title':
      case 'subtitle':
        return Obx(() {
          var isEditing = controller.dataBlocks[index].isEditing.obs;
          return TextField(
            controller: TextEditingController(text: block.content),
            style: TextStyle(
              fontSize: block.type == 'title' ? 24 : 18,
              fontWeight: block.type == 'title' ? FontWeight.bold : FontWeight.w600,
            ),
            enabled: isEditing.value,
            decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
            onSubmitted: (newValue) {
              block.content = newValue;
              block.isEditing = false;
              controller.updateBlock(index, block);
            },
          );
        });
      case 'list':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: block.content.split('\n').map((e) => Text(e)).toList(),
        );
      case 'image':
        return Image.network(block.content);
      case 'underline':
        return Text(block.content, style: TextStyle(decoration: TextDecoration.underline));
      default:
        return Container();
    }
  }

  void toggleEditMode(int index, BlockEditorModel block) {
    block.isEditing = !block.isEditing;
    controller.updateBlock(index, block);
  }
}
