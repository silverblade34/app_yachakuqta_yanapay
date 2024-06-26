import 'package:app_yachakuqta_yanapay/app/bindings/blockpage_student_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/course_student_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/editor_syllabus_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/editor_blockpage_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/home_administrator_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/home_student_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/home_teacher_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/login_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/syllabus_student_binding.dart';
import 'package:app_yachakuqta_yanapay/app/bindings/syllabusblock_forum_binding.dart';
import 'package:app_yachakuqta_yanapay/app/middlewares/global_middleware.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/blockpage_student/blockpage_student_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/course_student/course_student_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/editor_syllabus/editor_syllabus_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/editor_blockpage/editor_blockpage_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/home_administrator/home_administrator_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/home_student/home_student_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/home_teacher/home_teacher_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/login/login_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/splash/splash_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/syllabus_student/syllabus_student_page.dart';
import 'package:app_yachakuqta_yanapay/app/ui/pages/syllabusblock_forum/syllabusblock_forum_page.dart';
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
    ),
    GetPage(
      name: Routes.COURSE_STUDENT,
      page: () => const CourseStudentPage(),
      binding: CourseStudentBinding(),
    ),
    GetPage(
      name: Routes.SYLLABUS_STUDENT,
      page: () => const SyllabusStudentPage(),
      binding: SyllabusStudentBinding(),
    ),
    GetPage(
      name: Routes.EDITOR_SYLLABUS,
      page: () => const EditorSyllabusPage(),
      binding: EditorSyllabusBinding(),
    ),
    GetPage(
      name: Routes.BLOCKPAGE_STUDENT,
      page: () => const BlockPageStudentPage(),
      binding: BlockPageStudentBinding(),
    ),
    GetPage(
      name: Routes.EDITOR_BLOCKPAGE,
      page: () => const EditorBlockPagePage(),
      binding: EditorBlockPageBinding(),
    ),
    GetPage(
      name: Routes.SYLLABUSBLOCK_FORUM,
      page: () => const SyllabusBlockForumPage(),
      binding: SyllabusBlockForumBinding(),
    ),
  ];
}
