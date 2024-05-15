class BlockEditorModel {
  String content;
  String type;
  Details details;
  int order;

  BlockEditorModel({
    required this.content,
    required this.type,
    required this.details,
    required this.order,
  });
}

class Details {
  int height;
  int width;

  Details({
    required this.height,
    required this.width,
  });
}
