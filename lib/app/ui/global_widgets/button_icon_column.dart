import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:flutter/material.dart';

class ButtonIconColumn extends StatelessWidget {
  final VoidCallback onClick;
  final String description;
  final double? paddingVertical;
  final FontWeight? fontWeightDescription;
  final Icon? icon;
  final Color color;

  const ButtonIconColumn({
    super.key,
    required this.onClick,
    required this.description,
    this.icon,
    this.paddingVertical,
    this.fontWeightDescription,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        onClick();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => color),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: paddingVertical ?? 11,
            horizontal: 10
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(),
          ],
          const SizedBox(
            width: 5,
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              fontWeight: fontWeightDescription ?? FontWeight.w600,
              color: WHITE,
            ),
          ),
        ],
      ),
    );
  }
}
