import 'package:app_yachakuqta_yanapay/app/controllers/editor_test_controller.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/editor_test/widgets/block_icon.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditorTestPage extends GetView<EditorTestController> {
  const EditorTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CREAR CONTENIDO TEMARIO',
          style: TextStyle(fontSize: 17),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(),

            const Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        "Seleccione una opción para agregar un nuevo bloque",
                        style: TextStyle(color: GREY_LIGHT),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
