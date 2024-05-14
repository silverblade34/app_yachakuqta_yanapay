import 'package:app_yachakuqta_yanapay/app/data/models/block_editor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorTestController extends GetxController {
  RxList<BlockEditorModel> dataBlocks = RxList([]);

  void addBlock(BlockEditorModel block) {
    dataBlocks.add(block);
  }

  void updateBlock(int index, BlockEditorModel updatedBlock) {
    dataBlocks[index] = updatedBlock;
  }
}