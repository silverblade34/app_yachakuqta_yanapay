import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/course_dto.dart';
import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Container CardCourseStack(
    {required Course item}) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: const Color.fromARGB(255, 32, 32, 32),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
      image: DecorationImage(
        image: NetworkImage(item.imageBackground != ""
            ? '$urlImages$versionService$methodGetImageCourse${item.imageBackground}'
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
          bottom: 10, // Ajusta la posición vertical según sea necesario
          child: Text(
            item.title.toUpperCase(),
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: WHITE,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
