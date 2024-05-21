import 'package:app_yachakuqta_yanapay/app/controllers/blockpage_foro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlockPageForoPage extends GetView<BlockPageForoController> {
  const BlockPageForoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(title: Text('BlockPageForoPage')),

    body: SafeArea(
      child: Text('BlockPageForoController'))
    );
  }
}