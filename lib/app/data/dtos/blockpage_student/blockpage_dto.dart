// To parse this JSON data, do
//
//     final blockPageDto = blockPageDtoFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

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
    int page;
    String title;
    String syllabusBlockId;
    List<Block> blocks;
    DateTime createdAt;
    int v;

    DataBlockPage({
        required this.id,
        required this.page,
        required this.title,
        required this.syllabusBlockId,
        required this.blocks,
        required this.createdAt,
        required this.v,
    });

    factory DataBlockPage.fromJson(Map<String, dynamic> json) => DataBlockPage(
        id: json["_id"],
        page: json["page"],
        title: json["title"],
        syllabusBlockId: json["syllabusBlockId"],
        blocks: List<Block>.from(json["blocks"].map((x) => Block.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "page": page,
        "title": title,
        "syllabusBlockId": syllabusBlockId,
        "blocks": List<dynamic>.from(blocks.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "__v": v,
    };
}

class Block {
    int order;
    String content;
    String type;
    String base64;
    String nameImage;
    List<Detail> details;
    String id;

    Block({
        required this.order,
        required this.content,
        required this.type,
        required this.base64,
        required this.nameImage,
        required this.details,
        required this.id,
    });

    factory Block.fromJson(Map<String, dynamic> json) => Block(
        order: json["order"],
        content: json["content"],
        type: json["type"],
        base64: json["base64"],
        nameImage: json["nameImage"],
        details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "order": order,
        "content": content,
        "type": type,
        "base64": base64,
        "nameImage": nameImage,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
        "_id": id,
    };
}

class Detail {
    double width;
    double height;
    String id;

    Detail({
        required this.width,
        required this.height,
        required this.id,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        width:  json["width"].toDouble(),
        height: json["height"].toDouble(),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "_id": id,
    };
}
