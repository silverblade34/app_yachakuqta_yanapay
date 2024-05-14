class BlockEditorModel {
  String type;
  String content;
  bool isEditing;

  BlockEditorModel({required this.type, required this.content, this.isEditing = false});
}
