import 'package:app_yachakuqta_yanapay/app/routes/pages.dart';
import 'package:app_yachakuqta_yanapay/app/ui/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
    await GetStorage.init();
  runApp(
     GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      initialRoute: Routes.EDITOR_TEST,
      getPages: AppPages.pages,
      theme: appThemeData,
      builder: (context, widget) {
        widget = EasyLoading.init()(context, widget);
        return widget;
      },
    ),
  );
}
