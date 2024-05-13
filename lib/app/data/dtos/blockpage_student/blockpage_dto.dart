// To parse this JSON data, do
//
//     final blockPageDto = blockPageDtoFromJson(jsonString);

import 'dart:convert';

BlockPageDto blockPageDtoFromJson(String str) => BlockPageDto.fromJson(json.decode(str));

String blockPageDtoToJson(BlockPageDto data) => json.encode(data.toJson());

class BlockPageDto {
    String message;
    DataBlockPage data;
    bool status;

    BlockPageDto({
        required this.message,
        required this.data,
        required this.status,
    });

    factory BlockPageDto.fromJson(Map<String, dynamic> json) => BlockPageDto(
        message: json["message"],
        data: DataBlockPage.fromJson(json["data"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
        "status": status,
    };
}

class DataBlockPage {
    String id;
    String title;
    String content;
    int page;
    List<dynamic> delta;
    String syllabusBlockId;
    DateTime createdAt;
    int v;

    DataBlockPage({
        required this.id,
        required this.title,
        required this.content,
        required this.page,
        required this.delta,
        required this.syllabusBlockId,
        required this.createdAt,
        required this.v,
    });

    factory DataBlockPage.fromJson(Map<String, dynamic> json) => DataBlockPage(
        id: json["_id"],
        title: json["title"],
        content: json["content"],
        page: json["page"],
        delta: List<dynamic>.from(json["delta"].map((x) => x)),
        syllabusBlockId: json["syllabusBlockId"],
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "content": content,
        "page": page,
        "delta": List<dynamic>.from(delta.map((x) => x)),
        "syllabusBlockId": syllabusBlockId,
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}
