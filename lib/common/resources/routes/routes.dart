import 'package:get/get.dart';
import 'package:school_app/common/screens/login/screen/login_screen.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/student/screens/class/class_binding.dart';
import 'package:school_app/student/screens/class/class_screen.dart';
import 'package:school_app/student/screens/class/assignment_upload_screen.dart';
import 'package:school_app/student/screens/class/assignment_upload_binding.dart';
import 'package:school_app/student/screens/home%20screen/student_dashboard.dart';
import 'package:school_app/student/screens/home%20screen/student_home_binding.dart';
import 'package:school_app/common/screens/announcements%20screen/announcements_binding.dart';
import 'package:school_app/common/screens/announcements%20screen/announcements_screen.dart';
import 'package:school_app/teacher/screens/attendance/attendance_binding.dart';
import 'package:school_app/teacher/screens/attendance/attendance_screen.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_binding.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_screen.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_submission_detail_screen.dart';
import 'package:school_app/teacher/screens/classes/assignment/assignment_submissions_screen.dart';
import 'package:school_app/teacher/screens/classes/class_detail_screen.dart'
    as TeacherClassDetail;
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
import 'package:school_app/common/screens/settings/notifications_screen.dart';
import 'package:school_app/common/screens/settings/privacy_security_screen.dart';
import 'package:school_app/common/screens/settings/help_support_screen.dart';
import 'package:school_app/student/screens/class/class_detail_screen.dart'
    as StudentClassDetail;

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
      binding: StudentHomeBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.announcementScreen,
      page: () => const AnnouncementsScreen(),
      binding: AnnouncementsBinding(),
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
      name: RouteName.messagesScreen,
      page: () => MessagesScreen(),
      binding: MessagesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.chatScreen,
      page: () => const TeacherChatScreen(),
      binding: MessagesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.newConversationScreen,
      page: () => const NewConversationScreen(),
      binding: MessagesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.settingScreen,
      page: () => const SettingScreen(),
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
      page: () => const TeacherClassDetail.ClassDetailScreen(),
      binding: ClassesBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.classScreen,
      page: () => ClassScreen(),
      binding: ClassBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(
      name: RouteName.classDetailScreen,
      page: () => const StudentClassDetail.ClassDetailScreen(),
      binding: ClassBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.assignmentUploadScreen,
      page: () => const AssignmentUploadScreen(),
      binding: AssignmentUploadBinding(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.notificationsScreen,
      page: () => const NotificationsScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.privacySecurityScreen,
      page: () => const PrivacySecurityScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
    GetPage(
      name: RouteName.helpSupportScreen,
      page: () => const HelpSupportScreen(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
