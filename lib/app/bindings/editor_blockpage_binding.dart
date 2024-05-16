import 'package:app_yachakuqta_yanapay/app/controllers/editor_blockpage_controller.dart';
import 'package:get/get.dart';

class EditorBlockPageBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<EditorBlockPageController>(() => EditorBlockPageController());
  }
}