// To parse this JSON data, do
//
//     final blockEditorModel = blockEditorModelFromJson(jsonString);

import 'dart:convert';

BlockEditorModel blockEditorModelFromJson(String str) => BlockEditorModel.fromJson(json.decode(str));

String blockEditorModelToJson(BlockEditorModel data) => json.encode(data.toJson());

class BlockEditorModel {
    String content;
    String type;
    Details details;

    BlockEditorModel({
        required this.content,
        required this.type,
        required this.details,
    });

    factory BlockEditorModel.fromJson(Map<String, dynamic> json) => BlockEditorModel(
        content: json["content"],
        type: json["type"],
        details: Details.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "type": type,
        "details": details.toJson(),
    };
}

class Details {
    int height;
    int width;

    Details({
        required this.height,
        required this.width,
    });

    factory Details.fromJson(Map<String, dynamic> json) => Details(
        height: json["height"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
    };
}
