import 'package:app_yachakuqta_yanapay/app/controllers/editor_test_controller.dart';
import 'package:get/get.dart';

class EditorTestBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<EditorTestController>(() => EditorTestController());
  }
}