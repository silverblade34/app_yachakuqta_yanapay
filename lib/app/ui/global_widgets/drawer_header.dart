import 'package:app_yachakuqta_yanapay/app/utils/style_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String username = box.read("name");
    String perfil = box.read("perfil");
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: PRIMARY,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/images/icon_matematicas.png',
            width: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            username,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: WHITE, fontSize: 12),
          ),
          Text(
            perfil,
            style: const TextStyle(color: WHITE, fontSize: 13),
          )
        ],
      ),
    );
  }
}
