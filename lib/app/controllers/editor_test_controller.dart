import 'package:app_yachakuqta_yanapay/app/data/dtos/blockpage_student/blockpage_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:app_yachakuqta_yanapay/app/ui/global_widgets/button_icon_column.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

class EditorTestController extends GetxController {
  RxList<BlockEditorModel> dataBlocks = RxList([]);
  TextEditingController titleBlockPage = TextEditingController();
  final ImagePicker picker = ImagePicker();

  addBlock(BlockEditorModel block) {
    dataBlocks.add(block);
  }

  updateBlock(int index, BlockEditorModel updatedBlock) {
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
                        details: Details(height: 150, width: 150)),
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
          onTap: () async {
            await selectImageAndEditDimensions(context, block.order);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: block.content == ""
                ? Image.network(
                    'https://via.placeholder.com/150',
                    width: block.details.width,
                    height: block.details.height,
                  )
                : Image(
                    image: Image.file(
                      File(block.content),
                    ).image,
                    width: block.details.width,
                    height: block.details.height,
                    fit: BoxFit.cover,
                  ),
          ),
        );
      default:
        return const SizedBox(); // Widget por defecto si el tipo de bloque no coincide
    }
  }

  selectImageAndEditDimensions(BuildContext context, int orderBlock) async {
    BlockEditorModel blockPage = dataBlocks.firstWhere(
      (block) => block.order == orderBlock,
    );
    TextEditingController nameImage = TextEditingController();
    TextEditingController widthImage =
        TextEditingController(text: blockPage.details.width.toString());
    TextEditingController heightImage =
        TextEditingController(text: blockPage.details.height.toString());
    RxString imagePath = "".obs;
    RxString imageBase64 = "".obs;

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
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: GREY_LIGHT),
        ),
        content: SizedBox(
          height: 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ButtonIconColumn(
                    onClick: () async {
                      Map<String, dynamic> dataImage = await tomarFoto();
                      nameImage.text = dataImage["imageName"];
                      imagePath.value = dataImage["imagePath"];
                      imageBase64.value = dataImage["imageBase64"];
                    },
                    description: 'Tomar foto',
                    color: TERTIARY,
                    paddingVertical: 10,
                    fontWeightDescription: FontWeight.normal,
                    icon: const Icon(
                      Icons.camera_alt,
                      color: WHITE,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ButtonIconColumn(
                    onClick: () async {
                      Map<String, dynamic> dataImage =
                          await abrirGaleria(context);
                      nameImage.text = dataImage["imageName"];
                      imagePath.value = dataImage["imagePath"];
                      imageBase64.value = dataImage["imageBase64"];
                    },
                    description: 'Abrir galería',
                    fontWeightDescription: FontWeight.normal,
                    paddingVertical: 10,
                    color: TERTIARY,
                    icon: const Icon(
                      Icons.photo_library,
                      color: WHITE,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: TextField(
                  controller: nameImage,
                  enabled: false,
                  decoration: const InputDecoration(
                      labelText: 'Nombre de imagen',
                      labelStyle: TextStyle(fontSize: 15)),
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              const Text(
                "Dimensiones",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: widthImage,
                      decoration: const InputDecoration(
                          labelText: 'Width',
                          labelStyle: TextStyle(fontSize: 15)),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: TextField(
                      controller: heightImage,
                      decoration: const InputDecoration(
                          labelText: 'Height',
                          labelStyle: TextStyle(fontSize: 15)),
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 15),
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
                fontWeightDescription: FontWeight.normal,
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
                fontWeightDescription: FontWeight.normal,
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

  Future<Map<String, dynamic>> tomarFoto() async {
    if (await _pedirPermisoCamara()) {
      final XFile? imagen = await picker.pickImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 100,
        source: ImageSource.camera,
      );
      if (imagen != null) {
        String documentoBase64String = await convertImageBase64(imagen);
        return {
          'imageName': imagen.name,
          'imagePath': imagen.path,
          'imageBase64': documentoBase64String,
        };
      }
    } else {
      EasyLoading.showInfo("Debe otorgar permisos para la cámara");
    }
    return {'imagePath': "", 'imageBase64': "", 'imageName': ""};
  }

  Future<Map<String, dynamic>> abrirGaleria(BuildContext context) async {
    if (await _pedirPermisoGaleria()) {
      final XFile? imagen = await picker.pickImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 100,
        source: ImageSource.gallery,
      );
      if (imagen != null) {
        String documentoBase64String = await convertImageBase64(imagen);
        return {
          'imageName': imagen.name,
          'imagePath': imagen.path,
          'imageBase64': documentoBase64String,
        };
      }
    } else {
      EasyLoading.showInfo("Debe otorgar permisos para acceder a la galeria");
    }
    return {'imagePath': "", 'imageBase64': "", 'imageName': ""};
  }

  Future<String> convertImageBase64(XFile imagen) async {
    List<int> fileBytes = await imagen.readAsBytes();
    return base64Encode(fileBytes);
  }

  Future<bool> _pedirPermisoGaleria() async {
    PermissionStatus storagePermission = await Permission.storage.request();
    PermissionStatus photosPermission = await Permission.photos.request();

    return storagePermission == PermissionStatus.granted ||
        photosPermission == PermissionStatus.granted;
  }

  Future<bool> _pedirPermisoCamara() async {
    if (await Permission.camera.request().isGranted) {
      return true;
    } else {
      return false;
    }
  }
}
