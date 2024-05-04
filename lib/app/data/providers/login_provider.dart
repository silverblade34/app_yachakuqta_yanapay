import 'package:app_yachakuqta_yanapay/app/utils/global_utils.dart';
import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> authLogin(String username, String password) async {
    Map<String, dynamic> payload = {
      'username': username,
      'password': password,
    };
    try {
      final response = await post('$url$versionService$methodLogin', payload)
          .timeout(const Duration(milliseconds: 25000));
      return response;
    } catch (e) {
      throw Exception("Error de conexión al servidor");
    }
  }
}
