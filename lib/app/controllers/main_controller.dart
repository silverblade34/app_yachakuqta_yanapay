import 'package:get/get.dart';
import 'dart:convert';

class MainController extends GetxController {
  String generateToken(String username, String role) {
    // Generar token JWT con expiración de 2 horas
    int expiryTimeSeconds =
        DateTime.now().add(const Duration(hours: 10)).millisecondsSinceEpoch ~/
            1000;
    Map<String, dynamic> payload = {
      'exp': expiryTimeSeconds,
      'username': username,
      'role': role
    };
    String payloadString = base64.encode(utf8.encode(json.encode(payload)));
    String token = 'header.$payloadString.signature';
    return token;
  }
}
