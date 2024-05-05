import 'package:app_yachakuqta_yanapay/app/bindings/home_administrator_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/home_student_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/home_teacher_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/login_binding.dart';
import 'package:app_yachakuqta_yanapay/app/middlewares/global_middleware.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/home_administrator/home_administrator_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/home_student/home_student_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/home_teacher/home_teacher_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/login/login_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/splash/splash_page.dart';
import 'package:get/get.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
      middlewares: [
        GlobalMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.HOME_ADMINISTRATOR,
      page: () => const HomeAdministratorPage(),
      binding: HomeAdministratorBinding(),
    ),
    GetPage(
      name: Routes.HOME_STUDENT,
      page: () => const HomeStudentPage(),
      binding: HomeStudentBinding(),
    ),
    GetPage(
      name: Routes.HOME_TEACHER,
      page: () => const HomeTeacherPage(),
      binding: HomeTeacherBinding(),
    )
  ];
}
