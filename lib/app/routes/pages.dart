import 'package:app_yachakuqta_yanapay/app/ui/pages/login/login_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/splash/splash_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
    )
  ];
}
