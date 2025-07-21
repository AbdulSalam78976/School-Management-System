import 'package:get/get.dart';
import 'package:school_app/common/login/screen/login_screen.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/student/screens/student_dashboard.dart';
import 'package:school_app/teacher/screens/teacher_dashboard.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.teacherHomeScreen,
      page: () => TeacherHomeScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.studentHomeScreen,
      page: () => StudentHomeScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
