import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:app_yachakuqta_yanapay/app/ui/global_widgets/button_icon_column.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
                  int lengthOrder = dataBlocks.length;
                  dataBlocks.add(
                    BlockEditorModel(
                        type: "TEXTO",
                        content: "",
                        order: lengthOrder + 1,
                        details: Details(height: 0, width: 0)),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.text_increase),
                title: const Text('Subtitulo'),
                onTap: () {
                  int lengthOrder = dataBlocks.length;
                  dataBlocks.add(
                    BlockEditorModel(
                        type: "SUBTITULO",
                        content: "",
                        order: lengthOrder + 1,
                        details: Details(height: 0, width: 0)),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.text_format),
                title: const Text('Texto subrayado'),
                onTap: () {
                  int lengthOrder = dataBlocks.length;
                  dataBlocks.add(
                    BlockEditorModel(
                        type: "TEXTO_SUBRAYADO",
                        content: "",
                        order: lengthOrder + 1,
                        details: Details(height: 0, width: 0)),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Imagen'),
                onTap: () {
                  int lengthOrder = dataBlocks.length;
                  dataBlocks.add(
                    BlockEditorModel(
                        type: "IMAGEN",
                        content: "",
                        order: lengthOrder + 1,
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
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Ingresar texto',
              border: InputBorder.none,
            ),
            style: TextStyle(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
            maxLines:
                null, // Permite que el campo de texto se expanda dinámicamente
            textInputAction: TextInputAction.newline,
          ),
        );
      case 'SUBTITULO':
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Ingresar subtítulo',
              border: InputBorder.none,
            ),
            style: TextStyle(
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
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Ingresar texto subrayado',
              border: InputBorder.none,
            ),
            style: TextStyle(
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
    TextEditingController widthImage = TextEditingController();
    TextEditingController heightImage = TextEditingController();
    Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ), // Ajusta el radio de las esquinas
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Editar imagen',
          style: TextStyle(fontSize: 18),
        ),
        content: SizedBox(
          height: 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Tomar foto'),
                onTap: () async {
                  print("-----------------------1");
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Abrir galería'),
                onTap: () async {
                  print("-----------------------2");
                },
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Dimensiones",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: widthImage,
                      decoration: const InputDecoration(labelText: 'Width'),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: heightImage,
                      decoration: const InputDecoration(labelText: 'Height'),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ButtonIconColumn(
                onClick: () {},
                description: "Eliminar imagen",
                color: PRIMARY,
                icon: const Icon(
                  Icons.delete_outline,
                  color: WHITE,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              ButtonIconColumn(
                onClick: () {},
                description: "Guardar cambios",
                color: PRIMARY,
                icon: const Icon(
                  Icons.check,
                  color: WHITE,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
