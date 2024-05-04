import 'package:app_yachakuqta_yanapay/app/controllers/home_administrator_controller.dart';
import 'package:get/get.dart';

class HomeAdministratorBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<HomeAdministratorController>(() => HomeAdministratorController());
  }
}