import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorTestController extends GetxController {
  RxList<BlockEditorModel> dataBlocks = RxList([]);
  TextEditingController titleBlockPage = TextEditingController();
  void addBlock(BlockEditorModel block) {
    dataBlocks.add(block);
  }

  void updateBlock(int index, BlockEditorModel updatedBlock) {
    dataBlocks[index] = updatedBlock;
  }

  showBlockSelectionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.text_fields),
                title: const Text('Texto'),
                onTap: () {
                  dataBlocks.add(
                    BlockEditorModel(type: "TEXTO", content: ""),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.text_increase),
                title: const Text('Subtitulo'),
                onTap: () {
                  dataBlocks.add(
                    BlockEditorModel(type: "SUBTITULO", content: ""),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.text_format),
                title: const Text('Texto subrayado'),
                onTap: () {
                  dataBlocks.add(
                    BlockEditorModel(type: "TEXTO_SUBRAYADO", content: ""),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Imagen'),
                onTap: () {
                  dataBlocks.add(
                    BlockEditorModel(type: "IMAGEN", content: ""),
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildBlockWidget(BlockEditorModel block) {
    switch (block.type) {
      case 'TEXTO':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Ingresar texto',
            ),
            style: const TextStyle(fontSize: 14.0),
          ),
        );
      case 'SUBTITULO':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Ingresar subtítulo',
            ),
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        );
      case 'TEXTO_SUBRAYADO':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Texto subrayado',
            style: const TextStyle(
              fontSize: 14.0,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      case 'IMAGEN':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            'https://via.placeholder.com/150',
            width: 150,
            height: 150,
          ),
        );
      default:
        return const SizedBox(); // Widget por defecto si el tipo de bloque no coincide
    }
  }
}
