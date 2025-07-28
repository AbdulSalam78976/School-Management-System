import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/announcements/announcements_controller.dart';
import 'package:school_app/common/components/announcements/announcements_model.dart';
import 'package:school_app/common/components/announcements/recent_announcements_widget.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/components/greetingcard/greeting_widget.dart';
import 'package:school_app/common/components/quick%20action%20cards/quick_action_card_controller.dart';
import 'package:school_app/common/components/quick%20action%20cards/quick_action_card_model.dart';
import 'package:school_app/common/components/quick%20action%20cards/quick_actions_widget.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_classes_controller.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_classes_model.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_classes_widget.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/teacher/data/teacher_drawer_data.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  // Find the permanent controllers
  final drawerController = Get.find<DrawerControllerCustom>();
  final appBarController = Get.find<AppBarController>();

  // Find controllers provided by the binding
  final quickActionCardController = Get.find<QuickActionCardController>();
  final upcomingClassesController = Get.find<UpcomingClassesController>();
  final announcementController = Get.find<AnnouncementController>();

  @override
  void initState() {
    super.initState();
    // Schedule all controller state updates for after the first frame is rendered.
    // This is the definitive fix for the "setState() or markNeedsBuild() called during build" error.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      // Set up the drawer
      drawerController.setUserName('Harper');
      drawerController.setItems(TeacherDrawerData.getTeacherDrawerItems());
      drawerController.setActiveIndex(0); // Set "Dashboard" as active

      // Set up the app bar
      appBarController.setTitle('Dashboard');

      // Create and set quick actions list
      final quickActions = [
        QuickActionCardModel(
          label: "Classes",
          icon: Icons.class_outlined,
          onTap: () {
            Get.toNamed(RouteName.teacherClassesScreen);
          },
        ),
        QuickActionCardModel(
          label: "Attendance",
          icon: Icons.calendar_today_outlined,
          onTap: () {
            Get.toNamed(RouteName.teacherAttendanceScreen);
          },
        ),
        QuickActionCardModel(
          label: "Timetable",
          icon: Icons.watch_later_outlined,
          onTap: () {},
        ),
        QuickActionCardModel(
          label: "Results",
          icon: Icons.grade_outlined,
          onTap: () {},
        ),
      ];
      quickActionCardController.setQuickActions(quickActions);

      // Create and set upcoming classes list
      final upcomingClasses = [
        UpcomingClassesModel(
          time: "09:00 AM-10:00 AM",
          subject: "Science",
          grade: "Grade 7",
        ),
        UpcomingClassesModel(
          time: "11:00 AM-12:00 PM",
          subject: "Mathematics",
          grade: "Grade 8",
        ),
        UpcomingClassesModel(
          time: "01:00 PM-02:00 PM",
          subject: "History",
          grade: "Grade 6",
        ),
      ];
      upcomingClassesController.setUpcomingClasses(upcomingClasses);

      // Create and set announcements list
      final announcements = [
        AnnouncementsModel(
          title: 'Art Competition',
          description:
              'The annual art competition is next month. Submit your entries by the 5th.',
          date: '3 days ago',
        ),
        AnnouncementsModel(
          title: 'Library Closure',
          description:
              'The library will be closed for renovations from Monday.',
          date: '4 days ago',
        ),
      ];
      announcementController.setAnnouncements(announcements);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingWidget(),
                SizedBox(height: 20),
                QuickActionsWidget(),
                const UpcomingClassesWidget(),

                const AnnouncementsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
