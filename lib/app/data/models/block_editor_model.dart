import 'package:flutter/material.dart';

class BlockEditorModel {
  int order;
  String content;
  String type;
  String base64;
  String nameImage;
  Details details;
  TextEditingController controller;

  BlockEditorModel({
    required this.content,
    required this.type,
    required this.base64,
    required this.nameImage,
    required this.details,
    required this.order,
  }) : controller = TextEditingController(text: content);

  Map<String, dynamic> toJson() {
    return {
      'order': order,
      'content': type == "IMAGEN" ? content : controller.text,
      'type': type,
      'base64': base64,
      'nameImage': nameImage,
      'details': details.toJson(),
    };
  }
}

class Details {
  double height;
  double width;

  Details({
    required this.height,
    required this.width,
  });

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'width': width,
    };
  }
}
