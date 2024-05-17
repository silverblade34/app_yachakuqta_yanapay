// To parse this JSON data, do
//
//     final syllabusBlocksDto = syllabusBlocksDtoFromJson(jsonString);

import 'dart:convert';

SyllabusBlocksDto syllabusBlocksDtoFromJson(String str) =>
    SyllabusBlocksDto.fromJson(json.decode(str));

String syllabusBlocksDtoToJson(SyllabusBlocksDto data) =>
    json.encode(data.toJson());

class SyllabusBlocksDto {
  String message;
  List<DatumSyllabusBlock> data;
  bool status;

  SyllabusBlocksDto({
    required this.message,
    required this.data,
    required this.status,
  });

  factory SyllabusBlocksDto.fromJson(Map<String, dynamic> json) =>
      SyllabusBlocksDto(
        message: json["message"],
        data: List<DatumSyllabusBlock>.from(
            json["data"].map((x) => DatumSyllabusBlock.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "status": status,
      };
}

class DatumSyllabusBlock {
  String id;
  String title;
  int order;
  String syllabusId;
  DateTime createdAt;
  List<BlockPageResume> blockPages;

  DatumSyllabusBlock({
    required this.id,
    required this.title,
    required this.order,
    required this.syllabusId,
    required this.createdAt,
    required this.blockPages,
  });

  factory DatumSyllabusBlock.fromJson(Map<String, dynamic> json) =>
      DatumSyllabusBlock(
        id: json["_id"],
        title: json["title"],
        order: json["order"],
        syllabusId: json["syllabusId"],
        createdAt: DateTime.parse(json["createdAt"]),
        blockPages: List<BlockPageResume>.from(
            json["blockPages"].map((x) => BlockPageResume.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "order": order,
        "syllabusId": syllabusId,
        "createdAt": createdAt.toIso8601String(),
        "blockPages": List<dynamic>.from(blockPages.map((x) => x.toJson())),
      };
}

class BlockPageResume {
  String id;
  String title;
  int page;

  BlockPageResume({
    required this.id,
    required this.title,
    required this.page,
  });

  factory BlockPageResume.fromJson(Map<String, dynamic> json) =>
      BlockPageResume(
        id: json["_id"],
        title: json["title"],
        page: json["page"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "page": page,
      };
}
