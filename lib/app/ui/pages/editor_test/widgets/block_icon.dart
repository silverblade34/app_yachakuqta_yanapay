import 'package:flutter/material.dart';

class BlockIcon extends StatelessWidget {
  final VoidCallback onTapCallback;
  final Icon iconBlock;

  const BlockIcon(
      {super.key, required this.onTapCallback, required this.iconBlock});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: iconBlock,
      ),
      onTap: () {
        // Llama a la función callback cuando se activa onTap
        onTapCallback();
      },
    );
  }
}
