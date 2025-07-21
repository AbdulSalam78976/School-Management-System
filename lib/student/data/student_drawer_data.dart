import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/drawer/drawer_model.dart';

class StudentDrawerData {
  static List<DrawerModel> getStudentDrawerItems() => [
    DrawerModel(
      icon: Icons.dashboard_outlined,
      title: 'Dashboard',
      isActive: false, // This will be managed by the controller
      onTap: () {
        // Navigate to dashboard or stay on current screen
      },
    ),
    DrawerModel(
      icon: Icons.class_outlined,
      title: 'My Classes',
      isActive: false,
      onTap: () {
        Get.toNamed('/student/classes');
      },
    ),
    DrawerModel(
      icon: Icons.calendar_today_outlined,
      title: 'Attendance',
      isActive: false,
      onTap: () {
        Get.toNamed('/student/attendance');
      },
    ),
    DrawerModel(
      icon: Icons.message_outlined,
      title: 'Messages',
      isActive: false,
      onTap: () {
        Get.toNamed('/student/messages');
      },
    ),
    DrawerModel(
      icon: Icons.announcement_outlined,
      title: 'Announcements',
      isActive: false,
      onTap: () {
        Get.toNamed('/student/announcements');
      },
    ),
    DrawerModel(
      icon: Icons.settings_outlined,
      title: 'Settings',
      isActive: false,
      onTap: () {
        Get.toNamed('/student/settings');
      },
    ),
  ];
}
