// To parse this JSON data, do
//
//     final listCoursesDto = listCoursesDtoFromJson(jsonString);

import 'dart:convert';

ListCoursesDto listCoursesDtoFromJson(String str) => ListCoursesDto.fromJson(json.decode(str));

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

class Course {
    String id;
    String title;
    DateTime createdAt;
    int v;

    Course({
        required this.id,
        required this.title,
        required this.createdAt,
        required this.v,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["_id"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
