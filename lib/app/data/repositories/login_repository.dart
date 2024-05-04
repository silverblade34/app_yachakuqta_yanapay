import 'package:app_yachakuqta_yanapay/app/data/dtos/login/auth_login_dto.dart';
import 'package:app_yachakuqta_yanapay/app/data/providers/login_provider.dart';

class LoginRepository {
  LoginProvider api = LoginProvider();

  Future<AuthLoginDto> authLogin(String username, String password) async {
    final response = await api.authLogin(username, password);
    if (response.body == null) {
      throw Exception("No se recibieron datos en la respuesta");
    } else if (response.body["status"] == false) {
      throw Exception(response.body["message"]);
    }
    final body = response.body;
    AuthLoginDto data = AuthLoginDto.fromJson(body);
    return data;
  }
}
