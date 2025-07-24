import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/drawer/drawer_model.dart';
import 'package:school_app/common/resources/routes/route_names.dart';

class TeacherDrawerData {
  static List<DrawerModel> getTeacherDrawerItems() => [
    DrawerModel(
      icon: Icons.dashboard_outlined,
      title: 'Dashboard',
      isActive: false, // This will be managed by the controller
      onTap: () {
        // If on another screen, navigate to home, clearing the stack.
        if (Get.currentRoute != RouteName.teacherHomeScreen) {
          Get.offAllNamed(RouteName.teacherHomeScreen);
        }
      },
    ),
    DrawerModel(
      icon: Icons.class_outlined,
      title: 'Classes',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.teacherClassesScreen);
      },
    ),
    DrawerModel(
      icon: Icons.calendar_today_outlined,
      title: 'Attendance',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.teacherAttendanceScreen);
      },
    ),
    DrawerModel(
      icon: Icons.message_outlined,
      title: 'Messages',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.teacherMessagesScreen);
      },
    ),
    DrawerModel(
      icon: Icons.announcement_outlined,
      title: 'Announcements',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.teacherannouncementScreen);
      },
    ),
    DrawerModel(
      icon: Icons.settings_outlined,
      title: 'Settings',
      isActive: false,
      onTap: () {
        Get.toNamed(RouteName.teacherSettingScreen);
      },
    ),
  ];
}
