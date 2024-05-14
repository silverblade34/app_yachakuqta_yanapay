// To parse this JSON data, do
//
//     final blockEditorModel = blockEditorModelFromJson(jsonString);

import 'dart:convert';

BlockEditorModel blockEditorModelFromJson(String str) => BlockEditorModel.fromJson(json.decode(str));

String blockEditorModelToJson(BlockEditorModel data) => json.encode(data.toJson());

class BlockEditorModel {
    String content;
    String type;
    String path;
    BlockDetails details;

    BlockEditorModel({
        required this.content,
        required this.type,
        required this.path,
        required this.details,
    });

    factory BlockEditorModel.fromJson(Map<String, dynamic> json) => BlockEditorModel(
        content: json["content"],
        type: json["type"],
        path: json["path"],
        details: BlockDetails.fromJson(json["details"]),
    );

    Map<String, dynamic> toJson() => {
        "content": content,
        "type": type,
        "path": path,
        "details": details.toJson(),
    };
}

class BlockDetails {
    int height;
    int width;

    BlockDetails({
        required this.height,
        required this.width,
    });

    factory BlockDetails.fromJson(Map<String, dynamic> json) => BlockDetails(
        height: json["height"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
    };
}
