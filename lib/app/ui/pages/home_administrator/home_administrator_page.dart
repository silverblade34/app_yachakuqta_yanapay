import 'package:app_yachakuqta_yanapay/app/controllers/home_administrator_controller.dart';
import 'package:app_yachakuqta_yanapay/app/ui/global_widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAdministratorPage extends GetView<HomeAdministratorController> {
  const HomeAdministratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('HomeAdministratorPage')),
        drawer: const NavigationDrawerLayout(),
        body: SafeArea(child: Text('HomeAdministratorController')));
  }
}
