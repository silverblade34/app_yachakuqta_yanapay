// To parse this JSON data, do
//
//     final listCoursesDto = listCoursesDtoFromJson(jsonString);

import 'dart:convert';

import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/course_dto.dart';

ListCoursesDto listCoursesDtoFromJson(String str) =>
    ListCoursesDto.fromJson(json.decode(str));

String listCoursesDtoToJson(ListCoursesDto data) => json.encode(data.toJson());

class ListCoursesDto {
  String message;
  List<Course> data;
  bool status;

  ListCoursesDto({
    required this.message,
    required this.data,
    required this.status,
  });

  factory ListCoursesDto.fromJson(Map<String, dynamic> json) => ListCoursesDto(
        message: json["message"],
        data: List<Course>.from(json["data"].map((x) => Course.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}
