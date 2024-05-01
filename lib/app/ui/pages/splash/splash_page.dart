import 'package:app_yachakuqta_yanapay/app/controllers/splash_controller.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: BACKGROUND_LIGHT_CREAM,
      ),
      backgroundColor: BACKGROUND_LIGHT_CREAM,
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
            const Expanded(
              child: Center(
                child: Text(
                  "Yachacuqta \n Yanapay",
                  style: TextStyle(
                    fontFamily: "Jersey25",
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                    color: SECONDARY
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
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
