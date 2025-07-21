import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/announcements_widget.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/custom_card_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/components/greetingcard/greeting_widget.dart';
import 'package:school_app/common/components/section_header_with_action.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_class_tile.dart';
import 'package:school_app/common/components/upcoming%20classes/upcoming_classes_widget.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/teacher/screens/screens%20controller/teacher_dashboard_controller.dart';
import 'package:school_app/teacher/data/teacher_drawer_data.dart';
import 'package:school_app/common/components/drawer/drawer_controller.dart';
import 'package:school_app/common/components/appbar/appbar_controller.dart';
import 'package:school_app/common/components/quick action cards/quick_action_card_controller.dart';
import 'package:school_app/common/components/quick action cards/quick_action_card_model.dart';
import 'package:school_app/common/components/quick action cards/quick_actions_widget.dart';
import 'package:school_app/common/components/upcoming classes/upcoming_classes_controller.dart';
import 'package:school_app/common/components/upcoming classes/upcoming_classes_model.dart';

class TeacherHomeScreen extends StatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  State<TeacherHomeScreen> createState() => _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends State<TeacherHomeScreen> {
  final drawerController = Get.put(DrawerControllerCustom());
  final appBarController = Get.put(AppBarController());
  final teacherDashboardController = Get.put(TeacherDashboardController());
  final quickActionCardController = Get.put(QuickActionCardController());
  final upcomingClassesController = Get.put(UpcomingClassesController());

  @override
  void initState() {
    super.initState();
    // ✅ Safe to mutate state here
    drawerController.setUserName('Harper');
    drawerController.setItems(
      TeacherDrawerData.getTeacherDrawerItems(teacherDashboardController),
    );
    appBarController.setTitle('Dashboard');
    // Example notification count

    // Create and set quick actions list
    final quickActions = [
      QuickActionCardModel(
        label: "Classes",
        icon: Icons.class_outlined,
        onTap: () {},
      ),
      QuickActionCardModel(
        label: "Attendance",
        icon: Icons.calendar_today_outlined,
        onTap: () {},
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingWidget(),
                const SizedBox(height: 20),
                QuickActionsWidget(),
                const SizedBox(height: 20),
                UpcomingClassesWidget(),
                const SizedBox(height: 20),
                SectionHeaderWithAction(
                  title: 'Recent Announcements',
                  onTap: () {},
                ),
                RecentAnnouncements(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
