import 'package:app_yachakuqta_yanapay/app/controllers/login_controller.dart';
import 'package:app_yachakuqta_yanapay/app/ui/global_widgets/button_icon_column.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/login/widgets/text_field.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/login/widgets/text_pass.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: screenHeight,
            child: Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo/logo_math2.png',
                      width: 300,
                    ),
                    const Text(
                      "Bienvenido a Yanapay Yachacuyta!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: GREY_HARD,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //// USER INPUT
                    TextFieldWidget(
                      controller: controller.username,
                      text: "Usuario",
                      icon: Icons.person,
                      obscure: false,
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //// PASSWORD INPUT
                    TextFieldPass(
                      controller: controller.password,
                      obs: controller.obscurePass,
                      title: "Contraseña",
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ButtonIconColumn(
                      onClick: () {
                        controller.validateCredentials();
                      },
                      description: 'INGRESAR',
                      color: TERTIARY,
                      paddingVertical: 15,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Column(
                      children: [
                        Text(
                          "Yachacuyta",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: GREY_HARD,
                          ),
                        ),
                        Text(
                          "version 1.0",
                          style: TextStyle(
                            color: GREY_HARD,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
