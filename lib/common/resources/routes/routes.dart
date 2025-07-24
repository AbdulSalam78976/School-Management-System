import 'package:get/get.dart';
import 'package:school_app/common/screens/login/screen/login_screen.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/student/screens/student_dashboard.dart';
import 'package:school_app/teacher/screens/announcements%20screen/announcements_binding.dart';
import 'package:school_app/teacher/screens/announcements%20screen/announcements_screen.dart';
import 'package:school_app/teacher/screens/attendance/attendance_binding.dart';
import 'package:school_app/teacher/screens/attendance/attendance_screen.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_binding.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_screen.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_submission_detail_screen.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_submissions_screen.dart';
import 'package:school_app/teacher/screens/classes/class_detail_screen.dart';
import 'package:school_app/teacher/screens/classes/classes_binding.dart';
import 'package:school_app/teacher/screens/classes/classes_screen.dart';
import 'package:school_app/teacher/screens/home%20screen/teacher_dashboard.dart';
import 'package:school_app/teacher/screens/home%20screen/teacher_home_binding.dart';
import 'package:school_app/common/screens/messages/chat_screen.dart';
import 'package:school_app/common/screens/messages/messages_binding.dart';
import 'package:school_app/common/screens/messages/messages_screen.dart';
import 'package:school_app/common/screens/messages/new_conversation_screen.dart';
import 'package:school_app/common/screens/settings/profile/profile_binding.dart';
import 'package:school_app/common/screens/settings/profile/profile_screen.dart';
import 'package:school_app/common/screens/settings/setting_binding.dart';
import 'package:school_app/common/screens/settings/settings_screen.dart';

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
      page: () => const TeacherHomeScreen(),
      binding: TeacherHomeBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.studentHomeScreen,
      page: () => const StudentHomeScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.teacherannouncementScreen,
      page: () => const TeacherAnnouncementsScreen(),
      binding: TeacherAnnouncementsBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.teacherAttendanceScreen,
      page: () => const TeacherAttendanceScreen(),
      binding: AttendanceBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.teacherClassesScreen,
      page: () => const TeacherClassesScreen(),
      binding: ClassesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.teacherAssignmentScreen,
      page: () => const TeacherAssignmentScreen(),
      binding: AssignmentBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.assignmentSubmissionsScreen,
      page: () => AssignmentSubmissionsScreen(),
      binding: AssignmentBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.assignmentSubmissionsDetailScreen,
      page: () => AssignmentSubmissionDetailScreen(),
      binding: AssignmentBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.teacherMessagesScreen,
      page: () => TeacherMessagesScreen(),
      binding: TeacherMessagesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.teacherChatScreen,
      page: () => const TeacherChatScreen(),
      binding: TeacherMessagesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.teachernewConversationScreen,
      page: () => const NewConversationScreen(),
      binding: TeacherMessagesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.teacherSettingScreen,
      page: () => const TeacherSettingScreen(),
      binding: SettingBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.teacherClassDetailScreen,
      page: () => ClassDetailScreen(),
      binding: ClassesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
