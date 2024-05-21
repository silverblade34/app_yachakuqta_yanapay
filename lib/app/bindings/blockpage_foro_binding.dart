import 'package:app_yachakuqta_yanapay/app/controllers/blockpage_foro_controller.dart';
import 'package:get/get.dart';

class BlockPageForoBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<BlockPageForoController>(() => BlockPageForoController());
  }
}