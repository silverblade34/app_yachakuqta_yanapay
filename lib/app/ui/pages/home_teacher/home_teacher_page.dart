import 'package:app_yachakuqta_yanapay/app/controllers/home_teacher_controller.dart';
import 'package:app_yachakuqta_yanapay/app/ui/global_widgets/navigation_drawer.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTeacherPage extends GetView<HomeTeacherController> {
  const HomeTeacherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME',
          style: TextStyle(fontSize: pageTitleGlobal),
        ),
        elevation: 4,
      ),
      drawer: const NavigationDrawerLayout(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
