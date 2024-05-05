
class Syllabus {
  String id;
  String title;
  String description;
  int order;
  String courseId;
  DateTime createdAt;
  int v;

  Syllabus({
    required this.id,
    required this.title,
    required this.description,
    required this.order,
    required this.courseId,
    required this.createdAt,
    required this.v,
  });

  factory Syllabus.fromJson(Map<String, dynamic> json) => Syllabus(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        order: json["order"],
        courseId: json["courseId"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "order": order,
        "courseId": courseId,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
      };
}
