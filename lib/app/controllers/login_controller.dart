import 'package:app_yachakuqta_yanapay/app/controllers/main_controller.dart';
import 'package:app_yachakuqta_yanapay/app/data/models/menu_options_model.dart';
import 'package:app_yachakuqta_yanapay/app/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  RxBool obscurePass = RxBool(true);
  LoginRepository loginRepository = LoginRepository();
  late MainController mainController;
  final box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    Get.lazyPut(() => MainController());
    mainController = Get.find<MainController>();
  }

  validateCredentials() async {
    if (username.text.isEmpty && password.text.isEmpty) {
      EasyLoading.showInfo("Los campos usuario y contraseña están vacios");
    } else if (username.text.isEmpty) {
      EasyLoading.showInfo("Campo usuario vacío");
    } else if (password.text.isEmpty) {
      EasyLoading.showInfo("Campo contraseña vacío");
    } else {
      EasyLoading.show(status: 'Cargando...');
      try {
        final validate =
            await loginRepository.authLogin(username.text, password.text);
        String role = validate.data.role;
        constructMenu(role);

        String authToken =
            mainController.generateToken(validate.data.username, role);

        box.write('authTokenMobile', authToken);
        box.write('name', validate.data.name);
        box.write('role', role);
        box.write('token', validate.data.token);
        EasyLoading.dismiss();
        if (role == "STUDENT") {
          Get.offAllNamed("/home_student");
        } else if (role == "TEACHER") {
          Get.offAllNamed("/editor_blockpage");
        } else if (role == "ADMINISTRATOR") {
          Get.offAllNamed("/editor_blockpage");
        }
      } catch (error) {
        try {
          String errorMessage = error.toString().split(":")[1].trim();
          EasyLoading.showInfo(errorMessage);
        } catch (e) {
          EasyLoading.showInfo(error.toString());
        }
      }
    }
  }

  constructMenu(String role) {
    List<MenuOptionsModel> pages = [];
    String perfil = "Invitado";

    if (role == "STUDENT") {
      pages.add(
        MenuOptionsModel(
          title: 'Home',
          route: '/home_student',
        ),
      );
      perfil = "Estudiante";
    } else if (role == "TEACHER") {
      pages.add(
        MenuOptionsModel(
          title: 'Home',
          route: '/home_teacher',
        ),
      );
      perfil = "Profesor";
    } else if (role == "ADMINISTRATOR") {
      pages.add(
        MenuOptionsModel(
          title: 'Home',
          route: '/home_administrator',
        ),
      );
      perfil = "Administrador";
    }

    pages.add(
      MenuOptionsModel(
        title: 'Cambiar contraseña',
        route: '/password',
      ),
    );

    pages.add(
      MenuOptionsModel(
        title: 'Cerrar Sesión',
        route: '/logout',
      ),
    );

    box.write('perfil', perfil);
    box.write('menuOptions', pages);
  }
}
