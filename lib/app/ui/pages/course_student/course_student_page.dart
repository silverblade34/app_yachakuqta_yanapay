import 'package:app_yachakuqta_yanapay/app/controllers/course_student_controller.dart';
import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/syllabus_dto.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/course_student/widgets/card_syllabus.dart';
import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseStudentPage extends GetView<CourseStudentController> {
  const CourseStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DETALLE DE CURSO",
          style: TextStyle(fontSize: 17),
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight * 0.1,
                width: screenWidth - 20,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 32, 32, 32),
                  image: DecorationImage(
                    image: NetworkImage(controller.courseData.imageBackground !=
                            ""
                        ? '$url$versionService$methodGetImageCourse${controller.courseData.imageBackground}'
                        : "https://img.freepik.com/vector-gratis/ilustracion-libro-lectura_114360-8532.jpg?t=st=1715006993~exp=1715010593~hmac=3176fad2eeb7e1181edf3cdebe585ad4142921f578de4ed3942c1bf7422e2fc3&w=740"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom:
                          10, // Ajusta la posición vertical según sea necesario
                      child: Text(
                        controller.courseData.title.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Unidades",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: GREY_LIGHT,
                ),
              ),
              Container(
                height: screenHeight - (screenHeight * 0.3),
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: controller.courseData.syllabuses.length,
                  itemBuilder: (context, index) {
                    Syllabus item = controller.courseData.syllabuses[index];
                    return CardSyllabus(
                        item: item, courseStudentCL: controller);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
