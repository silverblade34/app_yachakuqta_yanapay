import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:get/get.dart';

class EditorSyllabusController extends GetxController {
  QuillController controllerQuill = QuillController.basic();

  void obtenerContenidoEditor() {
    String contenidoTexto = controllerQuill.document.toPlainText();
    Delta contenidoDelta = controllerQuill.document.toDelta();
    Map<String, dynamic> contenidoGuardado = {
      'content': contenidoTexto,
      'delta': contenidoDelta.toJson(),
    };
    print(jsonEncode(contenidoGuardado));
  }
}
