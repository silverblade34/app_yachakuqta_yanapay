import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:image_picker/image_picker.dart';
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
                    BlockEditorModel(
                        type: "TEXTO",
                        content: "",
                        details: Details(height: 0, width: 0)),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.text_increase),
                title: const Text('Subtitulo'),
                onTap: () {
                  dataBlocks.add(
                    BlockEditorModel(
                        type: "SUBTITULO",
                        content: "",
                        details: Details(height: 0, width: 0)),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.text_format),
                title: const Text('Texto subrayado'),
                onTap: () {
                  dataBlocks.add(
                    BlockEditorModel(
                        type: "TEXTO_SUBRAYADO",
                        content: "",
                        details: Details(height: 0, width: 0)),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Imagen'),
                onTap: () {
                  dataBlocks.add(
                    BlockEditorModel(
                        type: "IMAGEN",
                        content: "",
                        details: Details(height: 0, width: 0)),
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

  Widget buildBlockWidget(BlockEditorModel block, BuildContext context) {
    switch (block.type) {
      case 'TEXTO':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Ingresar texto',
              border: InputBorder.none,
            ),
            style: const TextStyle(fontSize: 14.0),
            maxLines:
                null, // Permite que el campo de texto se expanda dinámicamente
            textInputAction: TextInputAction.newline,
          ),
        );
      case 'SUBTITULO':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Ingresar subtítulo',
              border: InputBorder.none,
            ),
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: GREY_LIGHT,
            ),
            maxLines:
                null, // Permite que el campo de texto se expanda dinámicamente
            textInputAction: TextInputAction.newline,
          ),
        );
      case 'TEXTO_SUBRAYADO':
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Ingresar texto subrayado',
              border: InputBorder.none,
            ),
            style: const TextStyle(
              fontSize: 14.0,
              decoration: TextDecoration.underline,
            ),
            maxLines:
                null, // Permite que el campo de texto se expanda dinámicamente
            textInputAction: TextInputAction.newline,
          ),
        );
      case 'IMAGEN':
        return GestureDetector(
          onTap: () {
            selectImageAndEditDimensions(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://via.placeholder.com/150',
              width: 150,
              height: 150,
            ),
          ),
        );
      default:
        return const SizedBox(); // Widget por defecto si el tipo de bloque no coincide
    }
  }

  void selectImageAndEditDimensions(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await showModalBottomSheet<XFile>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Tomar foto'),
                onTap: () async {
                  Navigator.pop(context,
                      await picker.pickImage(source: ImageSource.camera));
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Abrir galería'),
                onTap: () async {
                  Navigator.pop(context,
                      await picker.pickImage(source: ImageSource.gallery));
                },
              ),
              const Divider(),
              const Text('Editar dimensiones:'),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: const InputDecoration(labelText: 'Width'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: const InputDecoration(labelText: 'Height'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
