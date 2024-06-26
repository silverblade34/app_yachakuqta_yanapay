import 'package:app_yachakuqta_yanapay/app/controllers/home_student_controller.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/course_dto.dart';
import 'package:app_yachakuqta_yanapay/app/ui/global_widgets/navigation_drawer.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/home_student/widgets/card_course_stack.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeStudentPage extends GetView<HomeStudentController> {
  const HomeStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CURSOS',
          style: TextStyle(fontSize: pageTitleGlobal),
        ),
        elevation: 4,
      ),
      drawer: const NavigationDrawerLayout(),
      body: SafeArea(
        child: Obx(
          () => Container(
            height: screenHeight - 90,
            padding: const EdgeInsets.all(15),
            child: RefreshIndicator(
              onRefresh: () async {
                await controller.getFindAllCourses();
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2 / 2,
                ),
                itemCount: controller.dataCourses.length,
                itemBuilder: (context, index) {
                  Course item = controller.dataCourses[index];
                  return InkWell(
                    child: CardCourseStack(item: item),
                    onTap: () {
                      controller.getToCourseDetail(item);
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
