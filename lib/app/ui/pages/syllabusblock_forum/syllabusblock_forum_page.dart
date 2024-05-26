import 'package:app_yachakuqta_yanapay/app/controllers/syllabusblock_forum_controller.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/syllabusblock_forum/widgets/create_thread.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/syllabusblock_forum/widgets/thread_question.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SyllabusBlockForumPage extends GetView<SyllabusBlockForumController> {
  const SyllabusBlockForumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            'Foro - ${controller.syllabusBlockName}',
            style: const TextStyle(fontSize: 15.5, color: GREY_HARD),
          ),
        ),
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CreateThread(
                controller: controller,
              ),
              const SizedBox(
                height: 10,
              ),
              ThreadQuestion(controller: controller),
              const SizedBox(
                height: 10,
              ),
              ThreadQuestion(controller: controller),
              const SizedBox(
                height: 10,
              ),
              ThreadQuestion(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
