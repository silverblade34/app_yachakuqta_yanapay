import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: non_constant_identifier_names
Obx TextFieldPass(
    {required TextEditingController controller,
    required RxBool obs,
    required String title}) {
  return Obx(
    () => TextField(
      controller: controller,
      obscureText: obs.value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        label: Text(title),
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            obs.value = !obs.value;
          },
          child: Icon(
            obs.value
                ? Icons.visibility_off
                : Icons.visibility, // Cambia el color según tu diseño
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      ),
    ),
  );
}
