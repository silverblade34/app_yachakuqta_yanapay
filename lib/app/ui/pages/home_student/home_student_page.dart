import 'package:app_yachakuqta_yanapay/app/controllers/home_student_controller.dart';
import 'package:app_yachakuqta_yanapay/app/ui/global_widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeStudentPage extends GetView<HomeStudentController> {
  const HomeStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME',
          style: TextStyle(fontSize: 17),
        ),
        elevation: 4,
      ),
      drawer: const NavigationDrawerLayout(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    );
  }
}
