import 'package:app_yachakuqta_yanapay/app/data/dtos/home_student/syllabus_dto.dart';

class Course {
  String id;
  String title;
  DateTime createdAt;
  int v;
  String imageIcon;
  String imageBackground;
  List<Syllabus> syllabuses;
  int totalSyllabus;

  Course({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.v,
    required this.imageIcon,
    required this.imageBackground,
    required this.syllabuses,
    required this.totalSyllabus,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["_id"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
        imageIcon: json["imageIcon"] ?? "",
        imageBackground: json["imageBackground"] ?? "",
        syllabuses: List<Syllabus>.from(
            json["syllabuses"].map((x) => Syllabus.fromJson(x))),
        totalSyllabus: json["totalSyllabus"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
        "imageIcon": imageIcon,
        "imageBackground": imageBackground,
        "syllabuses": List<dynamic>.from(syllabuses.map((x) => x.toJson())),
        "totalSyllabus": totalSyllabus,
      };
}
