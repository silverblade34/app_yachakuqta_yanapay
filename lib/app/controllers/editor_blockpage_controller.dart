import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/editor_blockpage_repository.dart';
import 'package:app_yachakuqta_yanapay/app/ui/global_widgets/button_icon_column.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

class EditorBlockPageController extends GetxController {
  RxList<BlockEditorModel> dataBlocks = RxList([]);
  TextEditingController titleBlockPage = TextEditingController();
  final ImagePicker picker = ImagePicker();
  EditorBlockPageRepository editorBlockPageRepository =
      EditorBlockPageRepository();

  addBlock(BlockEditorModel block) {
    dataBlocks.add(block);
  }

  updateBlock(int index, BlockEditorModel updatedBlock) {
    dataBlocks[index] = updatedBlock;
  }

  saveBlockPages() async {
    if (titleBlockPage.text != "") {
      EasyLoading.show(status: 'Cargando...');
      try {
        final validate = await editorBlockPageRepository.createBlockPage(
            1, titleBlockPage.text, "663d6ead0da9be8fe660e638", dataBlocks);
        EasyLoading.showSuccess(validate["message"]);
      } catch (error) {
        try {
          String errorMessage = error.toString().split(":")[1].trim();
          EasyLoading.showInfo(errorMessage);
        } catch (e) {
          EasyLoading.showInfo(error.toString());
        }
      }
    } else {
      EasyLoading.showInfo("Debe ingresar el titulo de la pagina");
    }
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
                        nameImage: "",
                        base64: "",
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
                        nameImage: "",
                        base64: "",
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
                        nameImage: "",
                        base64: "",
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
                        nameImage: "",
                        base64: "",
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
        return Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: GREY_EXTRA_LIGHT,
                ),
                onSelected: (String value) {
                  if (value == 'edit') {
                    // Acción para editar
                    print("EDITAR");
                  } else if (value == 'delete') {
                    int index = block.order - 1;
                    if (index >= 0 && index < dataBlocks.length) {
                      dataBlocks.removeAt(index);
                    }
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Editar'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Eliminar'),
                    ),
                  ];
                },
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: TextField(
                  controller: block.controller,
                  decoration: const InputDecoration(
                    hintText: 'Ingresar texto',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.justify,
                  maxLines:
                      null, // Permite que el campo de texto se expanda dinámicamente
                  textInputAction: TextInputAction.newline,
                ),
              ),
            ],
          ),
        );
      case 'SUBTITULO':
        return Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 3),
          child: Row(
            children: [
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: GREY_EXTRA_LIGHT,
                ),
                onSelected: (String value) {
                  if (value == 'edit') {
                    // Acción para editar
                    print("EDITAR");
                  } else if (value == 'delete') {
                    // Acción para eliminar
                    int index = block.order - 1;
                    if (index >= 0 && index < dataBlocks.length) {
                      dataBlocks.removeAt(index);
                    }
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Editar'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Eliminar'),
                    ),
                  ];
                },
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: TextField(
                  controller: block.controller,
                  decoration: const InputDecoration(
                    hintText: 'Ingresar subtítulo',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
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
              ),
            ],
          ),
        );
      case 'TEXTO_SUBRAYADO':
        return Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 3),
          child: Row(
            children: [
              PopupMenuButton<String>(
                icon: const Icon(
                  Icons.more_vert,
                  color: GREY_EXTRA_LIGHT,
                ),
                onSelected: (String value) {
                  if (value == 'edit') {
                    // Acción para editar
                    print("EDITAR");
                  } else if (value == 'delete') {
                    int index = block.order - 1;
                    if (index >= 0 && index < dataBlocks.length) {
                      dataBlocks.removeAt(index);
                    }
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Editar'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Eliminar'),
                    ),
                  ];
                },
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: TextField(
                  controller: block.controller,
                  decoration: const InputDecoration(
                    hintText: 'Ingresar texto subrayado',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    decoration: TextDecoration.underline,
                  ),
                  maxLines:
                      null, // Permite que el campo de texto se expanda dinámicamente
                  textInputAction: TextInputAction.newline,
                ),
              ),
            ],
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
                    'https://cdn.pixabay.com/photo/2017/01/25/17/35/picture-2008484_960_720.png',
                    width: block.details.width,
                    height: block.details.height,
                  )
                : Image(
                    image: Image.file(
                      File(block.content),
                    ).image,
                    width: block.details.width,
                    height: block.details.height,
                    fit: BoxFit.contain,
                  ),
          ),
        );
      default:
        return const SizedBox(); // Widget por defecto si el tipo de bloque no coincide
    }
  }

  selectImageAndEditDimensions(BuildContext context, int orderBlock) async {
    // Crea una copia de la lista dataBlocks
    List<BlockEditorModel> newDataBlocks = List.from(dataBlocks);

    // Busca el elemento en la nueva lista
    BlockEditorModel blockPage = newDataBlocks.firstWhere(
      (block) => block.order == orderBlock,
    );

    TextEditingController nameImage =
        TextEditingController(text: blockPage.nameImage);
    TextEditingController widthImage =
        TextEditingController(text: blockPage.details.width.toString());
    TextEditingController heightImage =
        TextEditingController(text: blockPage.details.height.toString());
    RxString imagePath = blockPage.content.obs;
    RxString imageBase64 = blockPage.base64.obs;

    Get.dialog(
      AlertDialog(
        insetPadding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
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
                  Expanded(
                    child: ButtonIconColumn(
                      onClick: () async {
                        Map<String, dynamic> dataImage = await takePhoto();
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
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: ButtonIconColumn(
                      onClick: () async {
                        Map<String, dynamic> dataImage =
                            await openGallery(context);
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
                        size: 16,
                      ),
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
                onClick: () async {
                  await showDialogDeleteBlock(blockPage.order);
                },
                description: "Eliminar imagen",
                fontWeightDescription: FontWeight.normal,
                paddingVertical: 10,
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
                onClick: () {
                  blockPage.content = imagePath.value;
                  blockPage.nameImage = nameImage.text;
                  blockPage.base64 = imageBase64.value;
                  blockPage.details.width =
                      double.parse(widthImage.text.toString());
                  blockPage.details.height =
                      double.parse(heightImage.text.toString());
                  // Reemplaza el elemento actualizado en la lista newDataBlocks
                  int indexToUpdate = newDataBlocks
                      .indexWhere((block) => block.order == orderBlock);
                  if (indexToUpdate != -1) {
                    newDataBlocks[indexToUpdate] = blockPage;
                  }

                  // Actualiza dataBlocks con la lista newDataBlocks
                  dataBlocks.assignAll(newDataBlocks);
                  Get.back();
                },
                description: "Guardar cambios",
                paddingVertical: 10,
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

  showDialogDeleteBlock(int order) async {
    Get.dialog(
      AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ), // Ajusta el radio de las esquinas
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Foto',
          style: TextStyle(fontSize: 21),
        ),
        content: const Text(
          '¿Está seguro que desea eliminar este bloque?',
          style: TextStyle(
            fontSize: 16,
            color: GREY_HARD,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Cerrar el modal
            },
            child: const Text('NO'),
          ),
          TextButton(
            onPressed: () async {
              if (order - 1 >= 0 && order - 1 < dataBlocks.length) {
                dataBlocks.removeAt(order - 1);
              }
              Get.back();
              Get.back();
            },
            child: const Text('SI'),
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> takePhoto() async {
    if (await _pedirPermisoCamara()) {
      final XFile? imagen = await picker.pickImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 100,
        source: ImageSource.camera,
      );
      if (imagen != null) {
        CroppedFile? croppedFile = await cropImages(imagen);
        String documentoBase64String = await convertImageBase64(croppedFile);
        return {
          'imageName': croppedFile.path.split('/').last,
          'imagePath': imagen.path,
          'imageBase64': documentoBase64String,
        };
      }
    } else {
      EasyLoading.showInfo("Debe otorgar permisos para la cámara");
    }
    return {'imagePath': "", 'imageBase64': "", 'imageName': ""};
  }

  Future<Map<String, dynamic>> openGallery(BuildContext context) async {
    if (await _pedirPermisoGaleria()) {
      final XFile? imagen = await picker.pickImage(
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 100,
        source: ImageSource.gallery,
      );
      if (imagen != null) {
        CroppedFile? croppedFile = await cropImages(imagen);

        String documentoBase64String = await convertImageBase64(croppedFile);
        return {
          'imageName': croppedFile.path.split('/').last,
          'imagePath': croppedFile.path,
          'imageBase64': documentoBase64String,
        };
      }
    } else {
      EasyLoading.showInfo("Debe otorgar permisos para acceder a la galeria");
    }
    return {'imagePath': "", 'imageBase64': "", 'imageName': ""};
  }

  Future<CroppedFile> cropImages(XFile image) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Recortar Imagen',
          toolbarColor: TERTIARY,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        )
      ],
    );

    return croppedFile!;
  }

  Future<String> convertImageBase64(CroppedFile imagen) async {
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
