import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/common/components/appbar/custom_appbar_widget.dart';
import 'package:school_app/common/components/drawer/custom_drawer.dart';
import 'package:school_app/common/resources/routes/route_names.dart';
import 'package:school_app/common/resources/theme/colors.dart';
import 'package:school_app/common/screens/settings/setting_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            CustomTile(
              icon: Icons.person,
              title: 'Profile',
              subtitle: 'View and edit your profile',
              onTap: () {
                Get.toNamed(RouteName.profileScreen);
              },
            ),

            CustomTile(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'Manage notification settings',
              onTap: () {
                Get.toNamed('/notifications_screen');
              },
            ),

            CustomTile(
              icon: Icons.security,
              title: 'Privacy & Security',
              subtitle: 'Manage privacy and security settings',
              onTap: () {
                Get.toNamed('/privacy_security_screen');
              },
            ),

            CustomTile(
              icon: Icons.help,
              title: 'Help & Support',
              subtitle: 'Get help and contact support',
              onTap: () {
                Get.toNamed('/help_support_screen');
              },
            ),

            CustomTile(
              icon: Icons.info,
              title: 'About',
              subtitle: 'App information and version',
              onTap: () {
                _showAboutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About School Management App'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Version: 1.0.0'),
            const SizedBox(height: 8),
            Text('Build: 2024.12.01'),
            const SizedBox(height: 8),
            Text(
              'A comprehensive school management system for students, teachers, and administrators.',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 24, child: Icon(icon)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppPalette.textColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppPalette.greyColor,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
