import 'package:app_yachakuqta_yanapay/app/controllers/splash_controller.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      // Redirigir a la página de login
      Get.offAllNamed('/login');
    });
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: WHITE,
      ),
      backgroundColor: WHITE,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 200,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/implementos_andinos.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontFamily: "Jersey25",
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3,
                      color: TERTIARY,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          "Yanapay",
                          textAlign: TextAlign.center,
                        ),
                      ],
                      pause: const Duration(milliseconds: 3000),
                      isRepeatingAnimation: true,
                    ),
                  ),
                  const Text(
                    "Yachacuyta",
                    style: TextStyle(
                      fontFamily: "Jersey25",
                      fontSize: 55,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3,
                      color: TERTIARY,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 230,
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/llama.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
